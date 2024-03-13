import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/constants/app_colors.dart';
import 'on_tap.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton(
      {required this.onTap,
      required this.text,
      required this.height,
      required this.color,
      this.textColor = AppColors.white,
      this.textSize = 18,
      super.key});

  VoidCallback onTap;
  String text;
  Color color;
  Color textColor;
  double height;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.h)), color: color),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: textSize,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w800,
              color: textColor),
        ),
      ),
    );
  }
}
