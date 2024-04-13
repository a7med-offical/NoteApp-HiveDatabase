import 'package:app/Model/note_model.dart';
import 'package:app/Views/Note_View.dart';
import 'package:app/provider/NoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
    runApp(const NoteApp());
  }


class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, fontFamily: 'PlaypenSans'),
        home: const NoteView(),
      ),
    );
  }
}

