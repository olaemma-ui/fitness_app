import 'dart:developer';
import 'dart:js_util';

import 'package:fitness_app/View/Widgets/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Service/Goal.service.dart';
import '../Widgets/ColorManager.dart';
import '../Widgets/FontManager.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> with GoalsService {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var options = getGoals();
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
          // padding: const EdgeInsets.all(8.0),
          physics: const RangeMaintainingScrollPhysics(),
          child: Center(
              child: RadioButton(
            onDelete: () {
              log('delete goal');
            },
            onChange: (index) async {
              await setGoal(context, index);
              setState(() {});
            },
            active: ColorManager.green,
            notActive: ColorManager.primary,
            activeIndex: activeIndex,
            selectable: true,
            options: options,
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await createGoal(context, props: [
            {
              'key': 'goal',
              'label': 'Goal Title',
              'keyboardType': TextInputType.name,
              'icon': Icons.list_alt_rounded,
              'formatter': FilteringTextInputFormatter.singleLineFormatter,
              'controller': TextEditingController()
            },
            {
              'key': 'steps',
              'label': 'Steps',
              'keyboardType': TextInputType.number,
              'icon': Icons.directions_walk_outlined,
              'formatter': FilteringTextInputFormatter.digitsOnly,
              'controller': TextEditingController()
            }
          ]);
          setState(() {
            log('goal modal');
          });
        },
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.light,
        child: const Icon(Icons.add),
      ),
    );
  }
}
