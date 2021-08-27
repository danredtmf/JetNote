import 'package:floor/floor.dart';
import 'note.dart';

/// Посредник, который обращается к базе через
/// сгенерированный код в note_database.g.dart
@dao
abstract class NoteDao {
  @insert
  Future<void> addNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @Query('select * from notes')
  Future<List<Note>> getAllNotes();
}
