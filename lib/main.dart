import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_projukti/core/core.dart';
import 'package:g_projukti/feature/splash/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes().lightTheme.copyWith(
            appBarTheme: const AppBarTheme(
                actionsIconTheme: IconThemeData(color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white))),
        getPages: AppRoutes.allRoutes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
