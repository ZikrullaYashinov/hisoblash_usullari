import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hisoblash_usullari/app/app.dart';
import 'package:hisoblash_usullari/ui/widget/global_app_bar.dart';
import 'package:hisoblash_usullari/ui/widget/simple_button.dart';
import 'package:hisoblash_usullari/ui/widget/text_field.dart';
import 'package:hisoblash_usullari/util/constants/app_colors.dart';
import 'package:hisoblash_usullari/util/tools/assistants.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';
import 'package:hisoblash_usullari/util/tools/router.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var boxData = Hive.box('data');

  void saveDataHive(QuadraticEquation quadraticEquation) {
    boxData.put('quadraticEquation', quadraticEquation);
  }

  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();
  final TextEditingController _controllerMin = TextEditingController();
  final TextEditingController _controllerMax = TextEditingController();
  final TextEditingController _controllerError = TextEditingController();

  @override
  void initState() {
    final archiveEquation =
        boxData.get('quadraticEquation') as QuadraticEquation?;

    _controllerA.text = archiveEquation?.a.toString() ?? "";
    _controllerB.text = archiveEquation?.b.toString() ?? "";
    _controllerC.text = archiveEquation?.c.toString() ?? "";
    _controllerMin.text = archiveEquation?.min.toString() ?? "";
    _controllerMax.text = archiveEquation?.max.toString() ?? "";
    _controllerError.text = archiveEquation?.error.toString() ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = minSize(context);

    double a;
    double b;
    double c;
    double myMin, myMax;
    double e = 0.001;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GlobalAppBar(
              name: "Hisoblash Usullari",
              onTap: () => Navigator.of(context).pushNamed(RouteName.info),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "Kayfitsent a (kvadrat tenglamadagi)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerA,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "a",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "Kayfitsent a (kvadrat tenglamadagi)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerB,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "b",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "Kayfitsent c (kvadrat tenglamadagi)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerC,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "c",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "oraliqning boshlang'ich chegarasi",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerMin,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "min",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "oraliqning oxirgi chegarasi",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerMax,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "max",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "xatolik",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grayLight3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.h)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 4),
                              child: TextField(
                                controller: _controllerError,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "xatolik",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SimpleButton(
                        onTap: () {
                          try {
                            a = double.parse(_controllerA.text);
                            b = double.parse(_controllerB.text);
                            c = double.parse(_controllerC.text);
                            myMin = double.parse(_controllerMin.text);
                            myMax = double.parse(_controllerMax.text);
                            e = double.parse(_controllerError.text);
                            var equation =
                                QuadraticEquation(a, b, c, myMin, myMax, e);
                            Navigator.of(context).pushNamed(RouteName.result,
                                arguments: equation);
                            saveDataHive(equation);
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Iltimos kiruvchi parametrlarni tekshiring")));
                          }
                        },
                        text: "Hisoblash",
                        height: size * 0.15,
                        color: AppColors.orangeDark,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
