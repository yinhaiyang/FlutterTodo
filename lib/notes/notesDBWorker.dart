import 'package:sqflite/sqflite.dart';
import 'package:flutter_todo/utils.dart' as utils;
import 'package:path/path.dart';

import 'notesModel.dart';

class NotesDBWorker {
  NotesDBWorker._();

  static final NotesDBWorker db = NotesDBWorker._();

  Database _db;

  Future get database async {
    if (_db == null) {
      _db = await init();
    }
    return _db;
  }

  Future<Database> init() async {
    String path = join(utils.docsDir.path, "notes.db");
    Database db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database inDB, int inVersion) async {
      await inDB.execute("CREATE TABLE IF NOT EXISTS notes ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "content TEXT,"
          "color TEXT"
          ")");
    });
    return db;
  }

  Future create(Note inNote) async {
    Database db = await database;
    var val = await db.rawQuery("SELECT MAX(id) + 1 AS id FROM notes");
    int id = val.first["id"];
    if (id == null) {
      id = 1;
    }
    return await db.rawInsert(
        "INSERT INTO notes (id, title, content, color)"
        "VALUES (?, ?, ?, ?)",
        [id, inNote.title, inNote.content, inNote.color]);
  }

  Note noteFromMap(Map inMap) {
    Note note = Note();
    note.id = inMap["id"];
    note.title = inMap["title"];
    note.content = inMap["content"];
    note.color = inMap["color"];
    return note;
  }

  Map<String, dynamic> noteToMap(Note note) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = note.id;
    map["title"] = note.title;
    map["content"] = note.content;
    map["color"] = note.color;
    return map;
  }
}
