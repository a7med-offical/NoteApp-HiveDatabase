import 'package:app/Views/Widget/Note_View_body.dart';
import 'package:app/Views/Widget/add_Note_Bottomsheet.dart';
import 'package:flutter/material.dart';


class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add,size:30),
      ),
      body: const NoteViewBody(),
    );
  }
}
