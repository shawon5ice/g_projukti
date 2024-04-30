import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class OfflineScreen extends StatelessWidget {
  final String img;
  final String title;
  final String des;
  const OfflineScreen({
    super.key,
    required this.img,
    required this.title,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDarkMode
          ? AppColors.k0F1113
          : AppColors.kLightTheme,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
            ),
            child: Image.asset(
              img,
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          addH(16),
          // title text
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: context.isDarkMode
                  ? AppColors.kC0C0C4
                  : AppColors.kLightText,
            ),
          ),
          // description text
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              des,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.kC0C0C4
                    : AppColors.kLightText,
              ),
            ),
          ),
          addH(150)
        ],
      ),
    );
  }
}
