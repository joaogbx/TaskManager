import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

  InputWidget({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 218, 218),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(
              label,
            ),
            contentPadding: EdgeInsets.all(5),
            border: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${label} é obrigatório';
          }
          if (label == 'Email') {
            if (!regex.hasMatch(value)) {
              return 'Email inválido';
            }
          }
        },
        autovalidateMode: AutovalidateMode.disabled,
      ),
    );
  }
}
