import 'package:app/Model/note_model.dart';
import 'package:app/Views/Widget/CustomButton.dart';
import 'package:app/Views/Widget/Custom_TextField.dart';
import 'package:app/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({
    super.key,
  });

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.teal];

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NoteProvider>(context, listen: false);
    return Form(
      key: formKey,
      autovalidateMode: autovalidatemode,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 20, right: 25),
          child: Column(
            children: [
              CustomTextField(
                  onSaved: (value) {
                    provider.title = value;
                  },
                  hintText: 'tilte',
                  maxlines: 1),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  onSaved: (value) {
                    provider.content = value;
                  },
                  hintText: 'subtitle',
                  maxlines: 4),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidatemode = AutovalidateMode.always;
                  }

                  Provider.of<NoteProvider>(context, listen: false).addNote(
                      NoteModel(
                          title: provider.title!,
                          subTitle: provider.content!,
                          date: 'Today',
                          color: (0xff1234)));
                  final box = Hive.box<NoteModel>('notes');
                  List<NoteModel> allData = box.values.toList();
                  for (NoteModel note in allData) {
                    print('Title: ${note.title}');
                    print('SubTitle: ${note.subTitle}');

                    print('---');
                  }
                  Navigator.pop(context);
                   ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
               top: 30,
                bottom: MediaQuery.of(context).size.height-120,
                right: 40,
                left:30
              ),
              content: const Text(
                'New Notes are added',
                style: TextStyle(color: Color(0xff101530),fontWeight: FontWeight.bold),
              ),
            ),
          );
                },
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
