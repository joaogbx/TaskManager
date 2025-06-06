import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final TimeOfDay timer;
  final DateTime date;
  final String locale;
  final Color color;
  bool isFavorite;

  Task(
      {required this.title,
      required this.description,
      required this.timer,
      required this.date,
      required this.locale,
      required this.color,
      required this.isFavorite});
}
