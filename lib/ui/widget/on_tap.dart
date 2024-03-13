import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnTap extends StatelessWidget {
  OnTap(
      {required this.child,
      required this.onTap,
      this.isAnimated = true,
      super.key});

  Widget child;
  VoidCallback onTap;
  bool isAnimated;

  @override
  Widget build(BuildContext context) {
    return isAnimated
        ? ZoomTapAnimation(
            onTap: onTap,
            child: child,
          )
        : child;
  }
}
