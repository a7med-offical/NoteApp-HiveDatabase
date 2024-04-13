import 'package:app/Views/Widget/Note_item.dart';
import 'package:app/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
 var provider =Provider.of<NoteProvider>(context,listen: true);
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: provider.listNote.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding:const EdgeInsets.symmetric(vertical: 5),
            child: NoteItem(
              noteModel:provider.listNote[index] ,
            ),
          );
        });
  }
}
