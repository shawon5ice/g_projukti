import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g_projukti/core/constants/app_colors.dart';
import 'package:g_projukti/feature/home/presentation/ui/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 1300),
      () => Get.offNamed(HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.webp',
              width: 210,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20),
            SpinKitRipple(
              color: AppColors.primaryColor,
              size: 50,
              duration: const Duration(milliseconds: 1500),
              borderWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
