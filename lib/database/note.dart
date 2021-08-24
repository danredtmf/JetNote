import 'package:floor/floor.dart';

@Entity(tableName: 'notes')
class Note {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String header;
  final String content;

  Note({this.id, required this.header, required this.content});
}