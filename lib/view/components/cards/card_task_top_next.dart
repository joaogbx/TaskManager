import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTaskTopNext extends StatelessWidget {
  const CardTaskTopNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 200.w,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.r),
          border: Border(left: BorderSide(color: Colors.redAccent, width: 10))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Próxima tarefa',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.notifications_active,
                  color: Color.fromARGB(255, 2, 142, 167),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Colors.blueAccent),
                SizedBox(width: 5),
                Text('',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                SizedBox(width: 20),
                Icon(Icons.place, color: Color.fromARGB(255, 153, 94, 255)),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    '',
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
