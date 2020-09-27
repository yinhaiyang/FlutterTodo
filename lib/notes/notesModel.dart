import 'package:flutter_todo/base_model.dart';

NotesModel notesModel;

class Note {
  int id;
  String title;
  String content;
  String color;

  @override
  String toString() {
    return 'Note{id: $id, title: $title, content: $content, color: $color}';
  }
}

class NotesModel extends BaseModel {
  String color;

  void setColor(String inColor) {
    color = inColor;
    notifyListeners();
  }
}
