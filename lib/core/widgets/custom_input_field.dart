import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? isPasswordField;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.isPasswordField,
    this.focusNode,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: true,
        obscureText: widget.isPasswordField != null ? _hidePassword : false,
        cursorColor: AppColors.primaryColor,
        keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(
          color: context.isDarkMode
              ? AppColors.kC0C0C4
              : AppColors.kLightText,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: context.isDarkMode
              ? AppColors.k1F2225
              : AppColors.kLightTheme2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: widget.labelText,
          hintStyle: TextStyle(
            color: context.isDarkMode
                ? AppColors.k595E63
                : AppColors.kLightTheme4,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: context.isDarkMode
                  ? AppColors.k292E32
                  : Colors.grey.shade400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: context.isDarkMode
                  ? AppColors.k292E32
                  : Colors.grey.shade400,
            ),
          ),
          suffixIcon: widget.isPasswordField != null
              ? IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    _hidePassword
                        ? 'assets/svg/eye.svg'
                        : 'assets/svg/eye_hide.svg',
                    height: 24,
                    width: 24,
                    color: context.isDarkMode
                        ? AppColors.k595E63
                        : AppColors.kLightText,
                    fit: BoxFit.contain,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
