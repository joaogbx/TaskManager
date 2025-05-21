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
        color: const Color.fromARGB(255, 68, 255, 31),
        borderRadius: BorderRadius.circular(10.r),
      ),
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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
              'Comprar mantimentos',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Colors.white),
                SizedBox(width: 5),
                Text('10:30', style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Icon(Icons.place, color: Colors.white),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Supermercado ABC',
                    style: TextStyle(color: Colors.white),
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
