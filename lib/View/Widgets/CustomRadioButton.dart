import 'dart:developer';

import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:fitness_app/View/Widgets/FontManager.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  Function onChange;
  Function onDelete;
  bool deletable;
  List<Map<String, dynamic>> options;
  Color active, notActive;
  var activeIndex;
  var selectable;
  RadioButton(
      {super.key,
      required this.onChange,
      required this.options,
      required this.notActive,
      required this.onDelete,
      this.deletable = true,
      this.activeIndex,
      this.selectable = false,
      required this.active});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _index = 0;
  late Color _active;
  late Color _notActive;
  late Color _color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _active = widget.active;
    _notActive = widget.notActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.options.map((e) {
          (widget.options.indexOf(e) == widget.activeIndex)
              ? _color = _active
              : _color = _notActive;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (widget.selectable)
                  ? () async {
                      await widget.onChange(widget.options.indexOf(e));
                      widget.activeIndex = widget.options.indexOf(e);
                      setState(() {
                        (widget.options.indexOf(e) == widget.activeIndex)
                            ? _color = _active
                            : _color = _notActive;
                      });
                    }
                  : null,
              child: Ink(
                width: 400,
                height: 80,
                decoration: BoxDecoration(
                    color: ColorManager.transPrimary,
                    border: Border.all(color: _color, width: 2),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: _color, width: 1),
                            borderRadius: BorderRadius.circular(1000)),
                        child: Ink(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: _color,
                              border: Border.all(color: _color),
                              borderRadius: BorderRadius.circular(1000)),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['key'],
                              style: TextStyle(
                                  inherit: false,
                                  fontSize: 18,
                                  color: ColorManager.light),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Steps :',
                                  style: FontManager.body1(
                                      color: ColorManager.light),
                                ),
                                Text(
                                  e['value'],
                                  style: FontManager.body1(
                                      color: ColorManager.lightBlue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Visibility(
                            visible: widget.deletable,
                            child: Ink(
                              width: 30,
                              height: 30,
                              // padding:
                              //     EdgeInsets.only(bottom: 20.0, right: 16.0),
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Align(
                                child: InkWell(
                                  radius: 100,
                                  child: Icon(Icons.delete_outline_rounded,
                                      color: Colors.red[400]),
                                  onTap: () {
                                    widget.onDelete(widget.options.indexOf(e));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList());
  }
}
