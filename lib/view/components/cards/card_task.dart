import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/models/task.dart';

class CardTask extends StatelessWidget {
  final Map<int, Task> task;

  CardTask({required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskController>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Dismissible(
        key: Key(task.keys.first.toString()),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            provider.removeTask(task.keys.first);
          } else {
            provider.removeTask(task.keys.first);
          }
        },
        background: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 4, 214, 81),
          child: Icon(
            Icons.check_sharp,
            color: Colors.white,
            size: 40,
          ),
        ),
        secondaryBackground: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          color: const Color.fromARGB(255, 255, 0, 81),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 254),
            borderRadius: BorderRadius.circular(5.r),
            border: Border(
              left: BorderSide(color: task.values.first.color, width: 8.w),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.values.first.title,
                  style: TextStyle(
                      fontSize: 18, height: 0, fontWeight: FontWeight.w500),
                ),
                Divider(height: 5),
                Text(
                  task.values.first.description,
                  style: TextStyle(
                    fontSize: 15,
                    height: 0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Divider(height: 5),
                Row(
                  children: [
                    Icon(Icons.calendar_month,
                        color: const Color.fromARGB(255, 255, 35, 244)),
                    Text(
                        '${task.values.first.date.day.toString().padLeft(2, '0')}/${task.values.first.date.month.toString().padLeft(2, '0')}'),
                    SizedBox(width: 20),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent),
                    Text(
                      '${task.values.first.time.hour.toString().padLeft(2, '0')}:${task.values.first.time.minute.toString().padLeft(2, '0')}',
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.place, color: Color.fromARGB(255, 153, 94, 255)),
                    Text(task.values.first.locale),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
