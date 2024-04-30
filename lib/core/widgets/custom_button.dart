import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final VoidCallback btnOnPressedFn;
  final int? buttonWidth;
  final int? buttonHeight;
  final num? buttonTextSize;
  const CustomButton({
    super.key,
    required this.btnText,
    required this.btnColor,
    this.buttonWidth,
    this.buttonTextSize,
    this.buttonHeight,
    required this.btnOnPressedFn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth?.toDouble()??double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: btnColor.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0.0, 2.0),
          )
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(btnColor),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth?.toDouble()?? context.width * .9, buttonHeight?.toDouble()??55),
          ),
        ),
        onPressed: btnOnPressedFn,
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: buttonTextSize?.toDouble()?? 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -.2,
            fontFamily: 'Poppins'
          ),
        ),
      ),
    );
  }
}
