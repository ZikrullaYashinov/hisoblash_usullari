import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants/app_colors.dart';
import '../../util/tools/assistants.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    required this.name,
    this.onTap,
    this.icon = const Icon(Icons.menu),
    this.iconChild,
    this.right,
    this.rightTap,
    super.key,
  });

  final String name;
  final VoidCallback? onTap;
  final Icon icon;
  final Widget? iconChild;
  final Icon? right;
  final VoidCallback? rightTap;

  @override
  Widget build(BuildContext context) {
    final size = minSize(context);
    final sizeWidth = width(context);
    return SizedBox(
      height: size * 0.15,
      width: sizeWidth,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.orangeDark),
        child: Row(
          mainAxisAlignment: right == null
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            if (iconChild != null)
              iconChild!
            else
              IconButton(
                onPressed: onTap ?? () {},
                icon: icon,
                color: AppColors.white,
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            if (right != null)
              IconButton(
                onPressed: rightTap,
                icon: right!,
              ),
          ],
        ),
      ),
    );
  }
}
