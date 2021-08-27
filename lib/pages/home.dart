import 'package:flutter/material.dart';
import '../pages/add_note.dart';
import '../widgets/note_item.dart';
import '../database/note.dart';
import '../database/note_provider.dart';
import 'package:provider/provider.dart';

/// Главный экран, способный менять свою структуру
/// по ходу дела (потому что [StatefulWidget])
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Костыль, обновляет состояние экрана для того,
  // чтобы показать новые объекты, созданные пользователем
  // (при повторном открытии приложение забывает,
  // что делал пользователь, но БД помнит, приходится помогать вручную)
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), _v);
    super.initState();
  }

  _v() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JetNote'),
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()));
        },
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: Provider.of<NoteProvider>(context).getAllNotes(),
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasData) {
            var notes = snapshot.requireData;

            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(note: notes[index]);
                },
              ),
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
