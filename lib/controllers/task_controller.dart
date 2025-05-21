import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class TaskController extends ChangeNotifier {
  final Map<int, Task> tasks = {
    1: Task(
      title: 'Comprar mantimentos',
      description: 'Leite, ovos, pão e frutas',
      timer: TimeOfDay(hour: 10, minute: 30),
      date: DateTime(2025, 5, 12),
      locale: 'Supermercado ABC',
      color: const Color.fromARGB(255, 24, 250, 126), // Verde claro
      isFavorite: false,
    ),
    2: Task(
      title: 'Reunião com o time',
      description: 'Discutir progresso do projeto X',
      timer: TimeOfDay(hour: 14, minute: 30),
      date: DateTime(2025, 5, 12),
      locale: 'Google Meet',
      color: const Color.fromARGB(255, 255, 30, 105), //Amarelo
      isFavorite: true,
    ),
    3: Task(
      title: 'Consulta médica',
      description: 'Check-up anual com Dr. João',
      timer: TimeOfDay(hour: 9, minute: 0),
      date: DateTime(2025, 5, 13),
      locale: 'Clínica Vida',
      color: const Color.fromARGB(255, 43, 128, 255), // Azul
      isFavorite: false,
    ),
    4: Task(
      title: 'Estudar Flutter',
      description: 'Revisar ListView, State e Provider',
      timer: TimeOfDay(hour: 18, minute: 0),
      date: DateTime(2025, 5, 13),
      locale: 'Casa',
      color: const Color.fromARGB(255, 255, 30, 105), // Vermelho
      isFavorite: false,
    ),
    5: Task(
      title: 'Aniversário da Ana',
      description: 'Comprar presente e enviar mensagem',
      timer: TimeOfDay(hour: 20, minute: 0),
      date: DateTime(2025, 5, 14),
      locale: 'Shopping Central',
      color: const Color.fromARGB(
          255, 24, 250, 126), // Verde claro (para dar continuidade)
      isFavorite: true,
    ),
  };

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
