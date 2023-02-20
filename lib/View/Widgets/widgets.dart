import 'dart:developer';

import 'package:flutter/material.dart';

import 'ColorManager.dart';

class Widgets {
  static final List<Map<String, dynamic>> _icons = [
    {
      'icon': const Icon(Icons.home_outlined, size: 20),
      'active': const Icon(Icons.home, size: 20),
      'label': 'Home'
    },
    {
      'icon': const Icon(Icons.list_outlined, size: 20),
      'active': const Icon(Icons.list_alt, size: 20),
      'label': 'Goals'
    },
    {
      'icon': const Icon(Icons.history_toggle_off, size: 20),
      'active': const Icon(Icons.history_outlined, size: 20),
      'label': 'History'
    }
  ];

  static Widget bottomNavigation(int index,
      {required Function onTap, required ThemeData theme}) {
    return BottomNavigationBar(
        onTap: (index) {
          onTap(index);
          log('btn $index');
        },
        currentIndex: index,
        // showSelectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        backgroundColor: theme.primaryColor,
        selectedItemColor: ColorManager.light,
        unselectedItemColor: ColorManager.lightBlue,
        items: _icons
            .map((e) => BottomNavigationBarItem(
                  icon: e['icon'],
                  label: e['label'],
                  activeIcon: e['active'],
                ))
            .toList());
  }

  static Ink appButton(
      {required Function onPressed,
      required AnimationController animationController}) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: ColorManager.transPrimary,
          borderRadius: BorderRadius.circular(1000)),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause, progress: animationController),
        color: ColorManager.light,
        iconSize: 30,
      ),
    );
  }
}
