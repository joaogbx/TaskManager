import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/task_list.dart';
import 'package:task_manager/models/task.dart';

class FormController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController localeController = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Color color = Colors.white;

  Future<void> onSubmited(BuildContext context) async {
    final provider = Provider.of<TaskList>(context, listen: false);

    await provider.addTask(
      Task(
        title: titleController.text,
        description: descriptionController.text,
        timer: '${time.hour}:${time.minute}',
        locale: localeController.text,
        color: color,
      ),
    );
    print('Título: ${titleController.text}');
    print('Descrição: ${descriptionController.text}');
    print('Local: ${localeController.text}');
    print('Data: ${date.day}/${date.month}/${date.year}');
    print('Hora: ${time.hour}:${time.minute}');
  }
}
