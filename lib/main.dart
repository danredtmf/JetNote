import 'package:flutter/material.dart';
import '../database/note_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

/// Главный класс в приложении, начало паутины логики
/// Присутствует некий наблюдатель в лице [NoteProvider],
/// которого можно вызвать в любом месте, где есть [BuildContext]
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JetNote',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Home(),
      ),
    );
  }
}
