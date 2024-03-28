import 'package:flutter/material.dart';
import 'package:hisoblash_usullari/ui/widget/item_result.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';
import '../../widget/global_app_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(this.quadraticEquation, {super.key});

  final QuadraticEquation quadraticEquation;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    var solution1 =
        widget.quadraticEquation.solutionMethodOfBisectingCrossSection();
    var solution2 = widget.quadraticEquation.solutionMethodOfVatars();
    var solution3 = widget.quadraticEquation.solutionMethodOfUrinma();
    var solution4 =
        widget.quadraticEquation.solutionMethodOfUrinmaModifikatsiya();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GlobalAppBar(
              name: "Natijalar",
              onTap: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemResult(
                      "Kesmani teng ikkiga bo'lish usuli yordamida",
                      "${solution1.isEmpty ? "Yechim yo'q" : solution1.last.x}",
                      solutions: solution1.isNotEmpty ? solution1 : null,
                    ),
                    ItemResult(
                      "Vatarlar usuli yordamida",
                      "${solution2.isEmpty ? "Yechim yo'q" : solution2.last.x}",
                      solutions: solution2.isNotEmpty ? solution2 : null,
                    ),
                    ItemResult(
                      "Urunma usuli yordamida",
                      "${solution3.isEmpty ? "Yechim yo'q" : solution3.last.x}",
                      solutions: solution3.isNotEmpty ? solution3 : null,
                    ),
                    ItemResult(
                      "Urunma usuli yordamida (modifikatsiya)",
                      "${solution4.isEmpty ? "Yechim yo'q" : solution4.last.x}",
                      solutions: solution4.isNotEmpty ? solution4 : null,
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
