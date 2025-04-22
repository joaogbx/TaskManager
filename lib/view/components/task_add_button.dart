import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task_manager/view/components/task_form.dart';

class TaskAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 115, 211, 255),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (builder) => TaskForm());
      },
      child: Text(
        '+ Criar tarefa',
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    );
  }
}
