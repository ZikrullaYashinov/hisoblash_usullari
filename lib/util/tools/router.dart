import 'package:flutter/material.dart';
import 'package:hisoblash_usullari/ui/home/ui/home_page.dart';
import 'package:hisoblash_usullari/ui/info/ui/info_page.dart';
import 'package:hisoblash_usullari/ui/result/ui/result_page.dart';
import 'package:hisoblash_usullari/data/model/equation.dart';

abstract class RouteName {
  static const home = '/home';
  static const result = '/result';
  static const info = '/info';
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
      default:
        return null;
    }
  }
}
