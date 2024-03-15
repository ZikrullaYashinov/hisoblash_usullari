
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../util/constants/app_colors.dart';
import '../util/constants/app_theme.dart';
import '../util/tools/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.orange),
    );
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AdaptiveTheme(
            light: AppTheme.light,
            initial: AdaptiveThemeMode.light,
            dark: AppTheme.light,
            builder: (light, dark) => const GetMaterialApp(
              initialRoute: RouteName.home,
              onGenerateRoute: AppRoutes.generateRoute,
              debugShowCheckedModeBanner: false,
              title: 'Hisoblash Usullari',
            ),
          );
        });
  }
}
