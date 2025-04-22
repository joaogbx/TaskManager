import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/models/task.dart';

class CardTask extends StatelessWidget {
  final Task task;
  CardTask(this.task);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 254),
          borderRadius: BorderRadius.circular(5.r),
          border: Border(
            left: BorderSide(color: task.color, width: 8.w),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                    fontSize: 18, height: 0, fontWeight: FontWeight.w500),
              ),
              Divider(
                height: 5,
              ),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 15,
                  height: 0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Divider(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.timer_outlined, color: Colors.blueAccent),
                  Text(task.timer),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.place,
                    color: const Color.fromARGB(255, 153, 94, 255),
                  ),
                  Text(task.locale),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
