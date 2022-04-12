import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final Color colors;
  final String text;
  final FontWeight fontWeight;

  AppLargeText(
      {Key? key,
      this.colors = Colors.white70,
      required this.text,
      this.size = 30,
      this.fontWeight = FontWeight.w100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sen(
          color: colors, fontSize: size, fontWeight: fontWeight),
    );
  }
}
