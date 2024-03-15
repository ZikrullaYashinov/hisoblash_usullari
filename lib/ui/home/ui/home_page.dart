import 'dart:math' as math;

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
import 'package:math_expressions/math_expressions.dart';

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

    _controllerA.text = archiveEquation?.fun.toString() ?? "x^2-4";
    _controllerB.text = archiveEquation?.fun1.toString() ?? "2*x";
    _controllerC.text = archiveEquation?.fun2.toString() ?? "2";
    _controllerMin.text = archiveEquation?.min.toString() ?? "0";
    _controllerMax.text = archiveEquation?.max.toString() ?? "5";
    _controllerError.text = archiveEquation?.error.toString() ?? "0.001";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = minSize(context);

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
                              "Funksiya",
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
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "f(x)",
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
                              "Funksiyaning 1 chi tartipli hosilasi",
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
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "f'(x)",
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
                              "Funksiyaning 2 chi tartipli hosilasi",
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
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "f''(x)",
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
                            myMin = double.parse(_controllerMin.text);
                            myMax = double.parse(_controllerMax.text);
                            e = double.parse(_controllerError.text);
                            var fun = _controllerA.text;
                            var fun1 = _controllerB.text;
                            var fun2 = _controllerC.text;
                            var equation = QuadraticEquation(
                                myMin, myMax, e, fun, fun1, fun2);
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
