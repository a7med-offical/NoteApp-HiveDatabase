import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:app/Model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final Box<NoteModel> _noteBox = Hive.box<NoteModel>('notes');
  List<NoteModel> listNote = [];
  String? title;
  String ?content;
  NoteProvider() {
    listNote = _noteBox.values.toList();
  }
  void addNote(NoteModel noteModel) {
    _noteBox.add(noteModel);
    listNote = _noteBox.values.toList();
    notifyListeners();
  }

  void removeNote(NoteModel noteModel) {
    _noteBox.delete(noteModel.key);
    listNote = _noteBox.values.toList();
    notifyListeners();
  }
}
