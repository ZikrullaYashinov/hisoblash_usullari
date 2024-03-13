import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hisoblash_usullari/util/tools/assistants.dart';

import '../../util/constants/app_colors.dart';

class ItemResult extends StatelessWidget {
  const ItemResult(this.title, this.result, {super.key});

  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = width(context);

    return Padding(
      padding: EdgeInsets.all(8.h),
      child: SizedBox(
        width: sizeWidth,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        "x=$result",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
                width: sizeWidth * 1,
                child: const DecoratedBox(
                    decoration: BoxDecoration(color: AppColors.grayLight)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
