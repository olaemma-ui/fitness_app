import 'package:fitness_app/View/Service/Home.service.dart';
import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:fitness_app/View/Widgets/FontManager.dart';
import 'package:fitness_app/View/Widgets/ProgressBar.paint.dart';
import 'package:flutter/material.dart';

import '../Widgets/Widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin, HomeService {
  late AnimationController _animationController;

  bool started = false;
  List<Map<String, dynamic>> daysData = [
    {'day': 'Tu', 'percent': 10.0},
    {'day': 'Wd', 'percent': 0.0},
    {'day': 'Th', 'percent': 0.0},
    {'day': 'Fr', 'percent': 0.0},
    {'day': 'Sa', 'percent': 0.0},
    {'day': 'Su', 'percent': 0.0},
    {'day': 'Mn', 'percent': 30.0},
  ];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 250));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

// MediaQuery.of(context).size.height
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        physics: const RangeMaintainingScrollPhysics(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 230,
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomPaint(
                    willChange: true,
                    painter: ProgressPaint(
                        completed: 80, strokeWidth: 14.0, radius: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '80%',
                              style: FontManager.heading1(
                                  color: ColorManager.light),
                            ),
                            SizedBox(
                              width: 100,
                              child: Divider(
                                color: ColorManager.lightBlue,
                              ),
                            ),
                            Text(
                              '100%',
                              style: FontManager.subHeading(
                                  color: ColorManager.lightBlue),
                            ),
                          ],
                        )),
                        TextButton.icon(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorManager.transPrimary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              started = !started;
                              setState(() {});
                            },
                            icon: AnimatedIcon(
                                icon: (started)
                                    ? AnimatedIcons.pause_play
                                    : AnimatedIcons.play_pause,
                                size: 20,
                                color: ColorManager.light,
                                progress: _animationController),
                            label: Text(
                              (started) ? 'Pause' : 'Start',
                              style:
                                  FontManager.body1(color: ColorManager.green),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  // alignment: WrapAlignment.end,
                  // spacing: 10.0,
                  // runSpacing: 10.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: daysData
                      .map((e) => SizedBox(
                            width: 40,
                            height: 50,
                            child: CustomPaint(
                                willChange: true,
                                painter: ProgressPaint(
                                    completed: e['percent'],
                                    strokeWidth: 2.0,
                                    radius: 12),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    e['day'],
                                    style: FontManager.body1(
                                        color: ColorManager.lightBlue),
                                  ),
                                )),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '00h 00m',
                          style:
                              FontManager.subHeading(color: ColorManager.light),
                        ),
                        Text(
                          'Duration',
                          style:
                              FontManager.body1(color: ColorManager.lightBlue),
                        )
                      ],
                    ),
                    const SizedBox(width: 28),
                    Column(
                      children: [
                        Text(
                          '0.00',
                          style:
                              FontManager.subHeading(color: ColorManager.light),
                        ),
                        Text(
                          'Km',
                          style:
                              FontManager.body1(color: ColorManager.lightBlue),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 28),
                Ink(
                  width: 350,
                  height: 90,
                  decoration: BoxDecoration(
                      color: ColorManager.transPrimary,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Goal :',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            ),
                            Text(
                              '00000',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Steps :',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            ),
                            Text(
                              '00000',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status :',
                              style:
                                  FontManager.body1(color: ColorManager.light),
                            ),
                            Text(
                              'ONGOING',
                              style: FontManager.body1(
                                  color: ColorManager.warning),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
