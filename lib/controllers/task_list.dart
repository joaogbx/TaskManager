import 'package:flutter/material.dart';

import 'package:task_manager/models/task.dart';

class TaskList extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  //Task get tasksFavorite => _tasks.firstWhere((e) => e.color == Colors.red);

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    notifyListeners();
  }
}
