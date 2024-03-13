import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hisoblash_usullari/ui/widget/sm_button.dart';
import 'package:hisoblash_usullari/util/constants/app_images.dart';
import 'package:hisoblash_usullari/util/tools/router.dart';

import '../../../util/constants/app_colors.dart';
import '../../widget/global_app_bar.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                GlobalAppBar(
                  name: "Ilova haqida",
                  iconChild: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: IconButton(
                      color: AppColors.white,
                      icon: const Icon(Icons.add),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.h),
                                child: Text(
                                  "Ushbu ilova hisoblash usullari fani uchun ishlab chiqildi.",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.h),
                                child: Text(
                                  "Ilova quyidagi 4 ta usul yordamida masalani yechadi\n1. Kesmani teng ikkiga bo'lish usuli\n2. Vatarlar usuli\n3. Urinmalar usuli\n4. Urinmalar usuli (modifikatsiya)",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.h),
                                child: Text(
                                  "Ustoz: Karimov Umid",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.h),
                                child: Text(
                                  "Ishlab chiqdi: Urganch Davlat Universiteti 211-amaliy matematika o'quvchisi Yashinov Zikrulla",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmButton(
                          icon: AppImages.telegram,
                          url: 'https://t.me/Zikrulla_Production',
                          width: 32.h,
                          height: 32.h),
                      SmButton(
                          icon: AppImages.github,
                          url:
                              'https://github.com/ZikrullaYashinov/hisoblash_usullari',
                          width: 32.h,
                          height: 32.h),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Text(
                      "Powerd by Zikrulla Production",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
