import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({required this.text,this.color, this.fontSize, super.key});
  final String text;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color != null? color! : context.isDarkMode ? Colors.white : Colors.black,
        fontSize: fontSize??18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
