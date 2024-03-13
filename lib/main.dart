import 'package:flutter/material.dart';
import 'package:hisoblash_usullari/data/adapter/hive_adapter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(QuadraticEquationAdapter());
  await Hive.openBox('data');

  runApp(const App());
}
