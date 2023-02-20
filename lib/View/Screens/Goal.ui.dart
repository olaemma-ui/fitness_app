import 'package:fitness_app/View/Widgets/CustomRadioButton.dart';
import 'package:flutter/material.dart';

import '../Widgets/ColorManager.dart';
import '../Widgets/FontManager.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // padding: const EdgeInsets.all(8.0),
        physics: const RangeMaintainingScrollPhysics(),
        child: Center(
            child: RadioButton(
          onChange: () {},
          active: ColorManager.green,
          notActive: ColorManager.primary,
          // activeIndex: 0,
          selectable: true,
          options: const [
            {'value': '1000', 'key': 'Easy'},
            {'value': '2000', 'key': 'Normal'},
            {'value': '3500', 'key': 'Hard'},
            {'value': '5000', 'key': 'Expert'},
          ],
        )));
  }
}
