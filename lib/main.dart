import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo/tasks/tasks.dart';
import 'package:path_provider/path_provider.dart';
import 'appointments/appointments.dart';
import 'notes/notes.dart';
import 'utils.dart' as utils;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  startMeUp() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;
    runApp(MyApp());
  }

  startMeUp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Todo',
        theme: ThemeData(),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Todo"),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.note), text: "Notes"),
                Tab(icon: Icon(Icons.assignment_turned_in), text: "Tasks"),
                Tab(icon: Icon(Icons.date_range), text: "Notes"),
              ]),
            ),
            body: TabBarView(children: [Notes(), Tasks(), Appointments()]),
          ),
        ));
  }
}
