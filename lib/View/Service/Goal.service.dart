import 'dart:developer';

import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:fitness_app/View/Widgets/FontManager.dart';
import 'package:fitness_app/View/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GoalsService {
  int count = 0;
  var activeIndex = null;
  late Box _box;
  createGoal(BuildContext context,
      {required List<Map<String, dynamic>> props}) async {
    return Widgets.appModal(context,
        child: Column(
          children: [
            Expanded(
              child: Form(
                  child: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: props
                        .map((e) => Widgets.appTextField(
                            iconData: e['icon'],
                            label: e['label'],
                            controller: e['controller'],
                            formatter: e['formatter'],
                            keyboardType: e['keyboardType']))
                        .toList(),
                  )),
                  Widgets.appButton(
                      onPressed: () {
                        log('saving.......');
                        _addGoal(
                            title: props
                                .firstWhere((element) =>
                                    element['key'] == 'goal')['controller']
                                .text,
                            steps: props
                                .firstWhere((element) =>
                                    element['key'] == 'steps')['controller']
                                .text);

                        Navigator.pop(context);
                      },
                      icon: Icons.add_circle_outline_rounded,
                      label: "Add Goal")
                ],
              )),
            ),
          ],
        ));
  }

  _addGoal({required String title, required String steps}) {
    _box = Hive.box('goals');
    _box.put(_box.length, {
      'goal': title,
      'steps': steps,
      'active': false,
      'date': DateTime.now()
    });

    log('saved');
    return true;
  }

  List<Map<String, dynamic>> getGoals() {
    _box = Hive.box('goals');
    // _box.clear();
    List<Map<String, dynamic>> options = [];
    log('before activeIndex = $activeIndex');
    for (var i = 0; i < _box.length; i++) {
      options.add({'key': _box.get(i)['goal'], 'value': _box.get(i)['steps']});
      log('i = $i active ${_box.get(i)['active']}');
      if (_box.get(i)['active']) {
        activeIndex = i;
        log('i = $i active index = $activeIndex');
      }
    }
    log('after activeIndex = $activeIndex');
    return options;
  }

  setGoal(BuildContext context, int index) async {
    _box = Hive.box('goals');
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorManager.primary,
            content: Text(
              'Are you sure you want to select this Goal',
              style: FontManager.body1(color: ColorManager.light),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    for (var i = 0; i < _box.length; i++) {
                      _box.get(i)['active'] = false;
                    }
                    _box.get(index)['active'] = true;
                    _box.put(index, _box.get(index));
                    for (var i = 0; i < _box.length; i++) {
                      log('active [$i] = ${_box.get(i)['active']}');
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  deleteGoal(BuildContext context, int index) async {
    _box = Hive.box('goals');
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorManager.primary,
            content: Text(
              'Are you sure you want to delete this Goal',
              style: FontManager.body1(color: ColorManager.light),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    if (activeIndex == index) {
                      activeIndex = null;
                    }
                    _box.delete(index);
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }
}
