// ignore_for_file: must_be_immutable
import 'package:app/Views/Widget/Custom_TextField.dart';
import 'package:app/Views/Widget/custom_AppBar.dart';
import 'package:app/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:app/Model/note_model.dart';
import 'package:provider/provider.dart';

class EditItemView extends StatefulWidget {
  EditItemView({super.key, this.note});

  NoteModel? note;
  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NoteProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(
              onPressed: () {
                
                widget.note!.title = provider.title ?? widget.note!.title;
                widget.note!.subTitle = provider.content ?? widget.note!.title;
                widget.note!.save();
                setState(() {});
                Navigator.pop(context);
              },
              icon: Icons.check,
              text: 'Edit a Note',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
                onChanged: (value) {
                  provider.title = value;
                },
                hintText: widget.note!.title,
                maxlines: 1),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                onChanged: (value) {
                  provider.content = value;
                },
                hintText: widget.note!.subTitle,
                maxlines: 4),
          ],
        ),
      ),
    );
  }
}
