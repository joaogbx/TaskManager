import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/create_account_controller.dart';
import 'package:task_manager/controllers/login_controller.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/view/pages/bar_and_bottom.dart';
import 'package:task_manager/view/pages/create_acount_page.dart';
import 'package:task_manager/view/pages/home_page.dart';

import 'package:task_manager/view/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateAccountController(),
        ),
        ChangeNotifierProvider(create: (_) => LoginController())
      ],
      child: ScreenUtilInit(
        designSize: Size(384.0, 838.4),
        child: MaterialApp(home: LoginPage(), routes: {}),
      ),
    );
  }
}
