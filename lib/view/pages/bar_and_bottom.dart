import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/view/pages/configurations_page.dart';
import 'package:task_manager/view/pages/home_page.dart';
import 'package:task_manager/view/pages/login_page.dart';

class BarAndBottom extends StatefulWidget {
  @override
  State<BarAndBottom> createState() => _BarAndBottomState();
}

class _BarAndBottomState extends State<BarAndBottom> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    Home(),
    ConfigurationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40.h,
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        title: IconButton(
          icon: Icon(
            Icons.logout,
            size: 24.sp,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            value == 0 ? _selectedPageIndex = 0 : _selectedPageIndex = 1;
          });
        },
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
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
    );
  }
}
