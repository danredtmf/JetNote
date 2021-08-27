import 'package:flutter/material.dart';
import '../pages/edit_note.dart';
import '../database/note_provider.dart';
import 'package:provider/provider.dart';

/// Позволяет добавлять [Note] в БД.
///
/// Похож на [EditNote] как две капли воды.
class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController header = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NoteProvider>(context, listen: false)
              .addNote(header.text, content.text);
          Navigator.of(context).pop();
        },
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        child: Icon(Icons.check),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: header,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                border: InputBorder.none,
                //isCollapsed: true,
                hintText: 'Enter text',
                hintStyle: TextStyle(
                  fontSize: 18,
                ),
                //labelText: 'Header',
                //labelStyle: TextStyle(
                //  fontSize: 18,
                //),
              ),
            ),
            Divider(thickness: 2),
            Expanded(
              child: TextField(
                controller: content,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  //border: OutlineInputBorder(),
                  border: InputBorder.none,
                  //isCollapsed: true,
                  hintText: 'Enter Text',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  //labelText: 'Content',
                  //labelStyle: TextStyle(
                  //  fontSize: 18,
                  //),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
