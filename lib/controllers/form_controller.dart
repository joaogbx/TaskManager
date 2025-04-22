import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController localeController = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  onSubmited() {
    print('Título: ${titleController.text}');
    print('Descrição: ${descriptionController.text}');
    print('Local: ${localeController.text}');
    print('Data: ${date.day}/${date.month}/${date.year}');
    print('Hora: ${time.hour}:${time.minute}');
  }
}
