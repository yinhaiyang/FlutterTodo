import 'package:flutter/material.dart';
import 'package:flutter_todo/notes/notesModel.dart';

import 'notesDBWorker.dart';

class Notes extends StatelessWidget {
  Notes() {
    notesModel.loadData("notes", NotesDBWorker.db);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Notes"),
    );
  }
}
