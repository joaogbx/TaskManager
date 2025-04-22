import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/models/task.dart';

class TaskList extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: 'teste',
      description: 'teste',
      timer: '21:00',
      locale: 'sala222f',
      color: Colors.red,
    ),
    Task(
      title: 'teste',
      description: 'teste',
      timer: '09:00',
      locale: 'sala333f',
      color: Colors.green,
    ),
  ];

  List<Task> get tasks => [..._tasks];

  Task get tasksFavorite => _tasks.firstWhere((e) => e.color == Colors.red);

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
