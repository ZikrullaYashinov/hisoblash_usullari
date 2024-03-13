import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double height(context) => MediaQuery.of(context).size.height;

double width(context) => MediaQuery.of(context).size.width;

double minSize(context) => MediaQuery.of(context).size.shortestSide;

double maxSize(context) => MediaQuery.of(context).size.longestSide;

Future<void> launchMyUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Cloud');
  }
}
