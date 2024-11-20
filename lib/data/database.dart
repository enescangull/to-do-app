import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  List toDoList = [];

  //reference to box
  final _myBox = Hive.box('mybox');

  //run this method if this is the first time openin this app
  void createInitialData() {
    toDoList = [
      ["Train coding", false],
      ["Tidy your room", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDB() {
    _myBox.put("TODOLIST", toDoList);
  }
}
