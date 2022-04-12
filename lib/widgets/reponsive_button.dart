import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double? height;
  double? width;
  bool? isResponsive;
  final Color colors;

  ResponsiveButton(
      {Key? key,
      this.isResponsive,
      this.width,
      required this.colors,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: colors,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: isResponsive==false?AppLargeText(
              text: "Book trip now",
              colors: Colors.black54,
              size: 20,
            ):Container(),
          ),
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 40,
              )),
        ],
      ),
    );
  }
}
