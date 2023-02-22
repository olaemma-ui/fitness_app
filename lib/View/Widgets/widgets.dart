import 'dart:developer';

import 'package:fitness_app/View/Widgets/FontManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      required IconData icon,
      required String label}) {
    return Ink(
      width: 400,
      height: 60,
      decoration: BoxDecoration(
          color: ColorManager.transPrimary,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton.icon(
        label: Text(
          label,
          style: FontManager.subHeading(color: ColorManager.light),
        ),
        onPressed: () {
          onPressed();
        },
        icon: Icon(icon),
      ),
    );
  }

  static appModal(BuildContext context,
      {required Widget child, double? height}) {
    return showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: ColorManager.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SizedBox(
            height: height ?? 340,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Add Goal",
                            style: FontManager.subHeading(
                                color: ColorManager.light),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close, color: ColorManager.light))
                      ],
                    ),
                    const SizedBox(height: 25),
                    Expanded(child: child)
                  ],
                )),
          );
        });
  }

  static SizedBox appTextField(
      {required IconData iconData,
      required String label,
      TextEditingController? controller,
      required TextInputFormatter formatter,
      required TextInputType keyboardType,
      String? Function(String?)? validator}) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        inputFormatters: [formatter],
        controller: controller,
        validator: (value) {
          return (validator != null) ? validator(value) : null;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
            fillColor: ColorManager.primary,
            contentPadding: const EdgeInsets.only(top: 50),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorManager.lightBlue)),
            labelText: label,
            labelStyle: TextStyle(color: ColorManager.lightBlue),
            prefixIcon: Icon(iconData, color: ColorManager.lightBlue)),
      ),
    );
  }
}
