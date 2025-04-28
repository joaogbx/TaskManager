import 'package:flutter/material.dart';

import 'package:task_manager/models/task.dart';

class TaskList extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  Task? get tasksFavorite {
    return taskFavoriteOnDay();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    notifyListeners();
  }

  Task? taskFavoriteOnDay() {
    for (var i = 0; i < _tasks.length; i++) {
      if (_tasks[i].date.day == DateTime.now().day &&
          _tasks[i].color.value ==
              const Color.fromARGB(255, 255, 30, 105).value) {
        return _tasks[i];
      }
    }
    notifyListeners();
    return null;
  }
}
