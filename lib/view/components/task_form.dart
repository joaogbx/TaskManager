import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/form_controller.dart';

class TaskForm extends StatefulWidget {
  final List<Color> color = [Colors.blue, Colors.pink, Colors.red];

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  int selected = 1;
  final dateTime = DateTime.now();
  var dataSelected = DateTime.now();
  var timeSelected = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FormController>(context);

    _showDataPicker() async {
      DateTime? dateAtual = await showDatePicker(
        context: context,
        firstDate: dateTime,
        lastDate: DateTime(2026),
      );
      if (dateAtual != null) {
        setState(() {
          controller.date = dateAtual;
          dataSelected = dateAtual;
        });
      }
    }

    _showTimerPicker() async {
      TimeOfDay? timeAtual = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (timeAtual != null) {
        setState(() {
          controller.time = timeAtual;
          timeSelected = timeAtual;
        });
      }
    }

    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Card(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 360.w,
                color: const Color.fromARGB(255, 219, 218, 218),
                child: TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(label: Text('Titulo')),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 360.w,
                color: const Color.fromARGB(255, 219, 218, 218),
                child: TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(label: Text('Descrição')),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 360.w,
                color: const Color.fromARGB(255, 219, 218, 218),
                child: TextFormField(
                  controller: controller.localeController,
                  decoration: InputDecoration(label: Text('Local')),
                ),
              ),
              Row(
                children: [
                  Text('Data selecionada: '),
                  Text(
                    '${dataSelected.day}/${dataSelected.month}/${dataSelected.year}',
                  ),
                  TextButton(
                    onPressed: _showDataPicker,
                    child: Text('Teste'),
                  )
                ],
              ),
              Row(
                children: [
                  Text('Hora selecionada: '),
                  Text(
                    '${timeSelected.hour}:${timeSelected.minute} ',
                  ),
                  TextButton(
                    onPressed: _showTimerPicker,
                    child: Text('Teste'),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text('Cor:    '),
                  ...List<Widget>.generate(3, (int index) {
                    return ChoiceChip(
                      label: Text(''),
                      selected: selected == index,
                      shape: CircleBorder(),
                      color: index == 0
                          ? MaterialStateProperty.all(Colors.blue)
                          : index == 1
                              ? MaterialStateProperty.all(
                                  const Color.fromARGB(255, 0, 0, 0))
                              : MaterialStateProperty.all(Colors.blue),
                      onSelected: (value) => setState(
                        () {
                          selected = index;
                          print(index);
                        },
                      ),
                    );
                  })
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: controller.onSubmited,
                child: Text('enviar', style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
