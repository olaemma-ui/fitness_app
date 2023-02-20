import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:fitness_app/View/Widgets/FontManager.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
          15,
          (index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: ColorManager.lightBlue,
                  radius: 20,
                  child: Icon(
                    Icons.directions_walk_rounded,
                    color: ColorManager.primary,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: ColorManager.light,
                    )),
                title: Text(
                  '0999099909',
                  style: FontManager.body1(color: ColorManager.light),
                ),
                subtitle: Text(
                  '09/09/0000',
                  style: FontManager.body1(color: ColorManager.lightBlue),
                ),
              )),
    );
  }
}
