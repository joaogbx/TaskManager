import 'package:flutter/rendering.dart';

class Task {
  final String title;
  final String description;
  final String timer;
  final String locale;
  final Color color;

  Task({
    required this.title,
    required this.description,
    required this.timer,
    required this.locale,
    required this.color,
  });
}
