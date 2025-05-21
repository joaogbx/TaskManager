import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTaskTopFavorite extends StatelessWidget {
  const CardTaskTopFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 45, 83),
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
                  'Tarefa favorita',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
            const Spacer(),
            Text(
              'Reunião com o time',
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
                Text('15:00', style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Icon(Icons.place, color: Colors.white),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Google Meet',
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
