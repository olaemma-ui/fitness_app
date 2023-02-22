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
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                    tileColor: ColorManager.transPrimary,
                    leading: Ink(
                      width: 55,
                      height: 60,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(
                        Icons.directions_walk_rounded,
                        color: ColorManager.lightBlue,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: ColorManager.light,
                        )),
                    title: Row(children: [
                      Text(
                        'My Goal',
                        style: FontManager.body1(color: ColorManager.lightBlue),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '9000',
                        style: FontManager.body1(color: ColorManager.lightBlue),
                      ),
                    ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Steps: ',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '1250',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start: ',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '00:00',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                            const Spacer(),
                            Text(
                              'Stop: ',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '00:00',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date: ',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '00/00/0000',
                              style: FontManager.body1(
                                  color: ColorManager.lightBlue),
                            ),
                          ],
                        ),
                      ],
                    )),
              )),
    );
  }
}
