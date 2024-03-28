import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hisoblash_usullari/ui/graphic/ui/graphic_page.dart';
import 'package:hisoblash_usullari/ui/home/ui/home_page.dart';
import 'package:hisoblash_usullari/ui/info/ui/info_page.dart';
import 'package:hisoblash_usullari/ui/result/ui/result_page.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';

abstract class RouteName {
  static const home = '/home';
  static const result = '/result';
  static const info = '/info';
  static const graphic = '/graphic';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RouteName.result:
        return MaterialPageRoute(
            builder: (context) => ResultPage(args as QuadraticEquation));
      case RouteName.info:
        return MaterialPageRoute(
            builder: (context) => const InfoPage());
      case RouteName.graphic:
        return MaterialPageRoute(
            builder: (context) => GraphicPage(quadraticEquation: args as QuadraticEquation,));
      default:
        return null;
    }
  }
}
