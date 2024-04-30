import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'package:get/get.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: kLightSystemBarTheme,
      titleTextStyle: TextStyle(
        color: AppColors.kLightText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
      backgroundColor: AppColors.kLightTheme,
      iconTheme: IconThemeData(color: AppColors.kLightText),
      actionsIconTheme: IconThemeData(
        color: AppColors.kLightText,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.black,
      fontFamily: "Poppins",
    ),
    scaffoldBackgroundColor: AppColors.kLightTheme,
    primaryColor: AppColors.kC0C0C4,
    backgroundColor: AppColors.kLightTheme,
  );
  static final kLightSystemBarTheme = SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: AppColors.kLightTheme,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: AppColors.kLightTheme,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  static final kDarkSystemBarTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.k0F1113,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.k0F1113,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark);

  static SystemUiOverlayStyle kGetSystemBarTheme(BuildContext context) {
    return SystemUiOverlayStyle(
      systemNavigationBarColor:
          context.isDarkMode ? AppColors.k292E32 : Colors.white,
      statusBarColor:
          context.isDarkMode ? AppColors.k292E32 : Colors.white,
      statusBarIconBrightness:
          context.isDarkMode ? Brightness.light : Brightness.dark,
      statusBarBrightness:
          context.isDarkMode ? Brightness.light : Brightness.light,
    );
  }

  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: kDarkSystemBarTheme,
      titleTextStyle: TextStyle(
        color: AppColors.kC0C0C4,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
      backgroundColor: AppColors.k0F1113,
      iconTheme: IconThemeData(color: AppColors.kC0C0C4),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      fontFamily: "Poppins",
    ),
    scaffoldBackgroundColor: AppColors.k0F1113,
    primaryColor: AppColors.kLightText,
    backgroundColor: AppColors.k0F1113,
  );
}
