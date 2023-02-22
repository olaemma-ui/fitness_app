import 'dart:developer';

import 'package:fitness_app/View/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeService {
  late Box _box;
  List<String> days = ['Mn', 'Tu', 'Wd', 'Th', 'Fr', 'Sa', 'Su'];

  Map<String, dynamic> currentActivity = {
      'goal': '',
      'goalSteps': '0',
      'steps': 0,
      'date': DateTime.now(),
      'day': '--',
      'hour': 0,
      'minutes': 0,
      'km': 0.0,
      'status': 'pending'
    };
  startActivity({
    required String goal,
    required double goalSteps,
  }) {
    var _goalBox = Hive.box('activity');

    _box = Hive.box('activity');
    Map<String, dynamic> activity = {
      'goal': goal,
      'goalSteps': goalSteps,
      'steps': 0,
      'date': DateTime.now(),
      'day': days[DateTime.now().weekday],
      'hour': 0,
      'minutes': 0,
      'km': 0.0,
      'status': 'pending'
    };
    _box.add(activity);
  }
}
