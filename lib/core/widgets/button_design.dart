import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core.dart';

class ButtonDesign extends StatelessWidget {
  final String btnTitle;
  final VoidCallback btnOnPressedFn;
  final String btnIcon;
  const ButtonDesign({
    Key? key,
    required this.btnTitle,
    required this.btnOnPressedFn,
    required this.btnIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: context.isDarkMode
                  ? AppColors.k292E32
                  : Colors.grey.shade900,
              width: 0.5,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          context.isDarkMode ? AppColors.k292E32 : Colors.transparent,
        ),
        fixedSize: MaterialStateProperty.all(
          Size(double.infinity, 54),
        ),
      ),
      onPressed: btnOnPressedFn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            btnIcon,
            color: context.isDarkMode
                ? AppColors.kC0C0C4
                : AppColors.kLightText,
          ),
          SizedBox(width: 8),
          Text(
            btnTitle,
            style: TextStyle(
              fontSize: 16,
              color: context.isDarkMode
                  ? AppColors.kC0C0C4
                  : const Color(0xFF1D3557),
            ),
          ),
        ],
      ),
    );
  }
}
