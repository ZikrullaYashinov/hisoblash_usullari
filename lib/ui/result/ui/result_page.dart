import 'package:flutter/material.dart';
import 'package:hisoblash_usullari/ui/widget/item_result.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';

import '../../widget/global_app_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.quadraticEquation, {super.key});

  QuadraticEquation quadraticEquation;

  @override
  Widget build(BuildContext context) {
    var solution1 = quadraticEquation.solutionMethodOfBisectingCrossSection();
    var solution2 = quadraticEquation.solutionMethodOfVatars();
    var solution3 = quadraticEquation.solutionMethodOfUrinma();
    var solution4 = quadraticEquation.solutionMethodOfUrinmaModifikatsiya();

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
                    ItemResult("Kesmani teng ikkiga bo'ish usuli yordamida",
                        "${solution1.isEmpty ? "Yechim yo'q" : solution1[0]}"),
                    ItemResult("Vatarlar usuli yordamida",
                        "${solution2.isEmpty ? "Yechim yo'q" : solution2[0]}"),
                    ItemResult("Urunma usuli yordamida",
                        "${solution3.isEmpty ? "Yechim yo'q" : solution3[0]}"),
                    ItemResult("Urunma usuli yordamida (modifikatsiya)",
                        "${solution4.isEmpty ? "Yechim yo'q" : solution4[0]}"),
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
