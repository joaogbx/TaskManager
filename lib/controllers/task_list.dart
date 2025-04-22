import 'package:flutter/material.dart';

import 'package:task_manager/models/task.dart';

class TaskList {
  final List<Task> _tasks = [
    Task(
      title: 'teste2',
      description: 'teste',
      timer: '${DateTime.now().hour}:${DateTime.now().minute}',
      locale: 'sala222f',
      color: Colors.red,
    ),
    Task(
      title: 'teste3',
      description: 'teste2',
      timer: '${DateTime.now().hour}:${DateTime.now().minute}',
      locale: 'sala333f',
      color: Colors.green,
    ),
    Task(
      title: 'teste3',
      description: 'teste2',
      timer: '${DateTime.now().hour}:${DateTime.now().minute}',
      locale: 'sala333f',
      color: Colors.green,
    ),
    Task(
      title: 'teste3',
      description: 'teste2',
      timer: '${DateTime.now().hour}:${DateTime.now().minute}',
      locale: 'sala333f',
      color: Colors.green,
    ),
    Task(
      title: 'teste3',
      description: 'teste2',
      timer: '${DateTime.now().hour}:${DateTime.now().minute}',
      locale: 'sala333f',
      color: Colors.green,
    ),
  ];

  List<Task> get tasks => [..._tasks];

  Task get tasksFavorite => _tasks.firstWhere((e) => e.color == Colors.red);

  addTask(Task task) {
    _tasks.add(task);
  }
}
