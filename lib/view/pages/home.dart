import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/task_list.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/view/components/card_task.dart';
import 'package:task_manager/view/components/card_task_top_favorite.dart';
import 'package:task_manager/view/components/card_task_top_next.dart';
import 'package:task_manager/view/components/task_add_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskList>(context);
    final taskList = provider.tasks;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.nightlight_outlined,
              size: 24.sp,
            ),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 115, 211, 255),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house, color: Colors.white, size: 24.sp),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white, size: 24.sp),
            label: 'Configurações',
          )
        ],
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color.fromARGB(255, 46, 46, 46),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      CardTaskTopFavorite(),
                      SizedBox(height: 20.h),
                      CardTaskTopNext()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: Text(
                          '10',
                          style: TextStyle(
                            height: 1.0,
                            color: Colors.white,
                            fontSize: 90.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(
                          '/09',
                          style: TextStyle(
                            height: 1.0,
                            color: Colors.white,
                            fontSize: 70.sp,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 0.7.sw,
                height: 0.06.sh,
                child: TaskAddButton(),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    var task = taskList[index];
                    return CardTask(
                      Task(
                        title: task.title,
                        description: task.description,
                        timer: task.timer,
                        locale: task.locale,
                        color: task.color,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
