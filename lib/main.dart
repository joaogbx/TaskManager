import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/form_controller.dart';
import 'package:task_manager/view/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FormController())],
      child: ScreenUtilInit(
        designSize: Size(384.0, 838.4),
        child: MaterialApp(
          home: Home(),
        ),
      ),
    );
  }
}
