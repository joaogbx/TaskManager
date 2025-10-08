import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/models/task.dart';

class TaskForm extends StatefulWidget {
  final List<Color> color = [Colors.blue, Colors.pink, Colors.red];

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locale = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Color color = const Color.fromARGB(255, 24, 250, 126);
  bool isFavorite = false;

  int? selected = null;
  DateTime? dateSelected = DateTime.now();
  TimeOfDay? timeSelected = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  _showDatePicker() async {
    dateSelected = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    setState(() {
      if (dateSelected != null) {
        date = dateSelected!;
      } else {
        dateSelected = DateTime.now();
      }
    });
  }

  _showTimePicker() async {
    timeSelected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      if (timeSelected != null) {
        time = timeSelected!;
      } else {
        timeSelected = TimeOfDay.now();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskController>(context);
    return SizedBox(
      height: MediaQuery.viewInsetsOf(context).bottom > 0 ? 780 : 450,
      child: Card(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          'Titulo',
                        ),
                        contentPadding: EdgeInsets.all(5),
                        border: InputBorder.none),
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatorio';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          'Descrição',
                        ),
                        contentPadding: EdgeInsets.all(5),
                        border: InputBorder.none),
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatorio';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          'Local',
                        ),
                        contentPadding: EdgeInsets.all(5),
                        border: InputBorder.none),
                    controller: locale,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatorio';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Row(
                  children: [
                    Text('Data selecionada: '),
                    Text(
                      '${dateSelected!.day.toString().padLeft(2, '0')}/${dateSelected!.month.toString().padLeft(2, '0')}/${dateSelected!.year}',
                    ),
                    TextButton(
                      onPressed: () {
                        _showDatePicker();
                      },
                      child: Text('Selecionar'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Hora selecionada: '),
                    Text(
                      '${timeSelected!.hour.toString().padLeft(2, '0')}:${timeSelected!.minute.toString().padLeft(2, '0')}',
                    ),
                    TextButton(
                      onPressed: () {
                        _showTimePicker();
                      },
                      child: Text('Selecionar'),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text('Cor:    '),
                    ...List<Widget>.generate(4, (int index) {
                      return ChoiceChip(
                        label: Text(''),
                        selected: selected == index,
                        shape: CircleBorder(),
                        color: index == 0
                            ? MaterialStateProperty.all(
                                const Color.fromARGB(255, 24, 250, 126))
                            : index == 1
                                ? MaterialStateProperty.all(
                                    const Color.fromARGB(255, 255, 239, 15))
                                : index == 2
                                    ? MaterialStateProperty.all(
                                        const Color.fromARGB(255, 43, 128, 255))
                                    : MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 255, 30, 105)),
                        onSelected: (value) {
                          setState(() {
                            selected = index;
                            switch (selected) {
                              case 0:
                                color = const Color.fromARGB(255, 24, 250, 126);
                                break;
                              case 1:
                                color = const Color.fromARGB(255, 255, 239, 15);
                                break;
                              case 2:
                                color = const Color.fromARGB(255, 43, 128, 255);
                                break;
                              default:
                                color = const Color.fromARGB(255, 255, 30, 105);
                                isFavorite = true;
                                break;
                            }
                          });
                        },
                      );
                    })
                  ],
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      provider.addTask(Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        locale: locale.text,
                        date: date,
                        time: time,
                        color: color,
                        isFavorite: isFavorite,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Enviar', style: TextStyle(fontSize: 14.sp)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
