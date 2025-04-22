import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTaskTopNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 68, 255, 31),
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
                  'Proxima tarefa',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.notifications_active,
                  color: const Color.fromARGB(255, 2, 142, 167),
                )
              ],
            ),
            Spacer(),
            Text(
              'Reunião com o professor',
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
                Text('18:00'),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.place),
                Text('Sala 222f'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
