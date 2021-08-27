import 'package:flutter/material.dart';
import 'note.dart';
import 'note_dao.dart';
import 'note_database.dart';

/// Берёт базу или создаёт её если не существует.
///
/// Для удобной связи имеет методы, которые
/// обращаются к таким же методам в базе
class NoteProvider extends ChangeNotifier {
  NoteDatabase? _database;
  late NoteDao noteDao = _database!.noteDao;

  NoteProvider() {
    initDb();
  }

  initDb() async {
    _database = await $FloorNoteDatabase.databaseBuilder('database.db').build();
  }

  Future<List<Note>> getAllNotes() async {
    var notes = await noteDao.getAllNotes();
    notifyListeners();
    return notes;
  }

  Future<void> addNote(String header, String content) async {
    var note = Note(header: header, content: content);
    await noteDao.addNote(note);
    notifyListeners();
  }

  Future<void> updateNote(int id, String newHeader, String newContent) async {
    var note = Note(id: id, header: newHeader, content: newContent);
    await noteDao.updateNote(note);
    notifyListeners();
  }

  Future<void> deleteNote(Note note) async {
    await noteDao.deleteNote(note);
    notifyListeners();
  }
}
