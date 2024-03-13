import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/tools/assistants.dart';
import 'on_tap.dart';

class SmButton extends StatelessWidget {
  SmButton(
      {super.key,
      required this.icon,
      required this.width,
      required this.height,
      required this.url});

  String icon;
  String url;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      child: SvgPicture.asset(
        icon,
        width: width,
        height: height,
      ),
      onTap: () {
        launchMyUrl(url);
      },
    );
  }
}
