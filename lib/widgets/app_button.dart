import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  IconData? icon;
  String? text;
  bool isIcon;

  AppButtons(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.isIcon = false,this.icon,this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isIcon
          ? Center(
            child: AppLargeText(
                text: text!,
                colors:Colors.black,
        size: 20,
              ),
          )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
