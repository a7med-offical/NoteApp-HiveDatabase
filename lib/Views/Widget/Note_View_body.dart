import 'package:app/Views/Widget/List_Note_Item.dart';
import 'package:app/Views/Widget/custom_AppBar.dart';
import 'package:flutter/material.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(icon: Icons.refresh,text: 'Note',onPressed: () {
              setState(() {
                
              });
               ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amberAccent,
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
              top: 30,
                bottom: MediaQuery.of(context).size.height-120,
                right: 40,
                left:30
              ),
              content: const Text(
                'Notes have been updated ',
                style: TextStyle(color: Color(0xff101530)),
              ),
            ),
          );
            },),
            const SizedBox(
              height: 20,
            ),
        const Expanded(child: NoteListView()),
          ],
        ),
      ),
    );
  }
}

// class ScaffoldMessage extends StatelessWidget {
//   const ScaffoldMessage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }