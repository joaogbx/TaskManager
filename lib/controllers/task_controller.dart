import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class TaskController extends ChangeNotifier {
  final Map<int, Task> tasks = {};

  int id = 0;

  void addTask(Task task) {
    id++;
    tasks.addAll(
      {id: task},
    );
    notifyListeners();
  }

  void removeTask(int id) {
    tasks.remove(id);
    notifyListeners();
  }
}
