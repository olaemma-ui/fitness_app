import 'dart:developer';

import 'package:fitness_app/View/Screens/Goal.ui.dart';
import 'package:fitness_app/View/Screens/History.ui.dart';
import 'package:fitness_app/View/Widgets/AppUiManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Screens/Home.ui.dart';
import 'Widgets/ColorManager.dart';
import 'Widgets/Widgets.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final ThemeData _theme = AppUiManager.theme();
  PageController? _pageController;
  int initialPage = 0;
  int _index = 0;
  late List<Widget> _pages;

  _gotoPage(index) {
    setState(() {
      _index = index;
      log('message $_index');
      _pageController!.animateToPage(index,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      const Home(),
      const Goals(),
      const History()
    ];
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        title: Text("Step-T"),
        // toolbarHeight: 40,
        // actions: [
        //   IconButt
        // ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _pageController,
            children: _pages,
            onPageChanged: (index) => _gotoPage(_index),
          ))
        ],
      ),
      bottomNavigationBar: Widgets.bottomNavigation(_index,
          onTap: (index) => _gotoPage(index), theme: _theme),
    );
  }
}
