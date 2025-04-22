import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskForm extends StatefulWidget {
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final dateTime = DateTime.now();
  var dataSelected = DateTime.now();
  var timeSelected = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    _showDataPicker() async {
      DateTime? dateAtual = await showDatePicker(
        context: context,
        firstDate: dateTime,
        lastDate: DateTime(2026),
      );
      if (dateAtual != null) {
        setState(() {
          dataSelected = dateAtual;
        });
      }
    }

    _showTimerPicker() async {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        setState(() {
          timeSelected = time;
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
                  decoration: InputDecoration(label: Text('Titulo')),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 360.w,
                color: const Color.fromARGB(255, 219, 218, 218),
                child: TextFormField(
                  decoration: InputDecoration(label: Text('Descrição')),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 360.w,
                color: const Color.fromARGB(255, 219, 218, 218),
                child: TextFormField(
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
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Color.fromRGBO(51, 83, 254, 1),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Color.fromRGBO(76, 217, 100, 1),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Color.fromRGBO(252, 6, 80, 1),
                      child: Icon(
                        Icons.star,
                        size: 16.sp,
                        color: Color.fromRGBO(255, 204, 0, 1),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('enviar', style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
