import 'package:flutter/material.dart';
import 'package:task_manager/models/user.dart';

class UserController extends ChangeNotifier {
  setUser(String id, String userName, String email) {
    User(
      userName: userName,
      email: email,
      id: id,
    );
  }
}
