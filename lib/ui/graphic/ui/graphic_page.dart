import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';
import 'package:hisoblash_usullari/util/tools/assistants.dart';

import '../../../util/constants/app_colors.dart';
import '../../../util/tools/router.dart';
import '../../widget/global_app_bar.dart';

class GraphicPage extends StatefulWidget {
  const GraphicPage({required this.quadraticEquation, super.key});

  final QuadraticEquation quadraticEquation;

  @override
  State<GraphicPage> createState() => _GraphicPageState();
}

class _GraphicPageState extends State<GraphicPage> {
  var max = 0.0;
  var min = 0.0;
  List<FlSpot> spots = [];

  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();

  @override
  void initState() {
    max = widget.quadraticEquation.max;
    min = widget.quadraticEquation.min;
    _controllerA.text = min.toString();
    _controllerB.text = max.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    spots =
        widget.quadraticEquation.getSpots();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalAppBar(
              icon: const Icon(Icons.arrow_back),
              name: "Funksiya grafigi",
              onTap: () => Navigator.of(context).pop(),
              right: const Icon(
                Icons.refresh,
                color: AppColors.white,
              ),
              rightTap: () {
                setState(() {
                  try {
                    min = double.parse(_controllerA.text.trim());
                    max = double.parse(_controllerB.text.trim());
                  } catch (e) {
                    print("Error");
                  }
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.h),
                            child: Text(
                              "min",
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
                              "max",
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
                                  hintText: "max",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: width(context),
                      width: width(context),
                      child: spots.isNotEmpty ? Graphic() : const SizedBox(),
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

  Widget Graphic() {
    print("Graphic min $min, max $max");
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: AppColors.orangeDark,
            width: 2,
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(color: AppColors.orange, strokeWidth: 1);
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return const FlLine(color: AppColors.orange, strokeWidth: 1);
          },
        ),
        maxX: max,
        maxY: max,
        minX: min,
        minY: min,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            // [
            //   const FlSpot(-2, 2),
            //   const FlSpot(-1, -2),
            //   const FlSpot(0, 0),
            //   const FlSpot(1, 2),
            //   const FlSpot(2, -1),
            //   const FlSpot(3, 3),
            //   const FlSpot(9, 8),
            // ],
            isCurved: true,
            barWidth: 3,
          ),
        ],
      ),
    );
  }
}
