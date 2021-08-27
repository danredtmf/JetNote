import 'package:flutter/material.dart';
import '../database/note.dart';
import '../database/note_provider.dart';
import 'package:provider/provider.dart';

/// Редактирует или удаляет [Note] из БД.
class EditNote extends StatefulWidget {
  final Note note;

  const EditNote({Key? key, required this.note}) : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController header = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    header.text = widget.note.header;
    content.text = widget.note.content;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Provider.of<NoteProvider>(context, listen: false)
                    .deleteNote(widget.note);
                Navigator.of(context).pop();
              });
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            int? id = widget.note.id;
            Provider.of<NoteProvider>(context, listen: false)
                .updateNote(id!, header.text, content.text);
          });
        },
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        child: Icon(Icons.save),
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
