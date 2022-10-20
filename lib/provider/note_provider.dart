import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../models/notes_model.dart';

class NoteProvider extends StateNotifier {
  NoteProvider() : super(0);
  List<NoteModel> _noteList = [];

  List<NoteModel> get noteList {
    return [..._noteList];
  }

  NoteModel findById(String id) {
    return _noteList.firstWhere((element) => element.id == id);
  }

  void addNote(NoteModel note) {
    _noteList.add(note);
  }

  void updateNote(String id, NoteModel editModel) {
    final noteIndex = _noteList.indexWhere((element) => element.id == id);
    if (noteIndex >= 0) {
      _noteList[noteIndex] = editModel;
    }
  }

  void deleteNote(String id) {
    _noteList.removeWhere((element) => element.id == id);
  }
}

final noteProvider = StateNotifierProvider((ref) {
  return NoteProvider();
});
