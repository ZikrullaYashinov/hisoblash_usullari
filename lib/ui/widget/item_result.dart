import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hisoblash_usullari/util/tools/assistants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/model/solution.dart';
import '../../util/constants/app_colors.dart';

class ItemResult extends StatefulWidget {
  const ItemResult(this.title, this.result, {this.solutions, super.key});

  final String title;
  final String result;
  final List<SolutionData>? solutions;

  @override
  State<ItemResult> createState() => _ItemResultState();
}

class _ItemResultState extends State<ItemResult> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

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
                        widget.title,
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
                        "x=${widget.result}",
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
              if (widget.solutions != null)
                SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  title: const ChartTitle(
                    text: "x qiymatning natijagacha bo'lgan yo'li",
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  series: <LineSeries<SolutionData, String>>[
                    LineSeries<SolutionData, String>(
                        dataSource: widget.solutions,
                        xValueMapper: (SolutionData sales, _) =>
                            sales.i.toString(),
                        yValueMapper: (SolutionData sales, _) => sales.x,
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true)),
                  ],
                )
              else
                const SizedBox(),
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
