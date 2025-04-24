import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task_manager/controllers/task_list.dart';

class CardTaskTopFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //inal provider = TaskList();
    //final taskFavorite = provider.tasksFavorite;

    return Container(
      height: 110.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 45, 83),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(Icons.star, color: Colors.amber)
              ],
            ),
            Spacer(),
            Text(
              '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.timer_outlined),
                Text(''),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.place,
                ),
                Text(''),
              ],
            )
          ],
        ),
      ),
    );
  }
}
