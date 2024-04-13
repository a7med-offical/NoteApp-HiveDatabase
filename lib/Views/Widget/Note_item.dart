import 'package:app/Model/note_model.dart';
import 'package:app/Views/EditItem.dart';
import 'package:app/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key ,required this.noteModel});

 final NoteModel? noteModel;
  @override
  Widget build(BuildContext context) {
        DateTime currentDateTime = DateTime.now();

    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return  EditItemView(note: noteModel,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child:  Padding(
          padding:const EdgeInsets.only(top: 16.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding:const EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    noteModel!.title,
                    style:const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Padding(
                  padding:const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                  noteModel!.subTitle,
                    style:const TextStyle(color: Colors.white),
                  ),
                ),
                trailing:GestureDetector(
                    onTap: () {
                      Provider.of<NoteProvider>(context, listen: false).removeNote(noteModel!);
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
                'Note has been deleted successfully',
                style: TextStyle(color: Color(0xff101530)),
              ),
            ),
          );
                    },
                  child: const FaIcon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8),
                child: Text('$currentDateTime'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
