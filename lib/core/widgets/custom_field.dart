import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';

class CustomField extends StatefulWidget {
  final TextEditingController textCon;
  String? prefixIcon;
  Widget? suffixWidget;
  final String hintText;
  bool? isPassField;
  TextInputType? inputType;
  double? width, height;
  FontWeight? txtFontWeight;
  Color? fillClr;
  Color? brdrClr;
  Color? txtClr;
  Color? disableClr;
  double? brdrRadius;
  double? txtSize;
  bool? enabledFlag;
  String? errorText;
  int? maxLine;

  void Function(String)? onCngdFn;
  void Function()? onSubmitted;
  void Function(String)? onEditStop;
  CustomField({
    super.key,
    required this.textCon,
    this.prefixIcon,
    this.suffixWidget,
    required this.hintText,
    this.isPassField,
    this.inputType,
    this.width,
    this.height,
    this.txtFontWeight,
    this.fillClr,
    this.disableClr,
    this.txtClr,
    this.brdrClr,
    this.brdrRadius,
    this.txtSize,
    this.onCngdFn,
    this.enabledFlag,
    this.errorText,
    this.onSubmitted,
    this.onEditStop,
    this.maxLine
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isPassField ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      // height: widget.height ?? 50.h,
      child: TextField(
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          fontSize: widget.txtSize ?? 12,
          // fontFamily: ConstantStrings.kFontFamily,
          fontWeight: widget.txtFontWeight ?? FontWeight.normal,
          color: widget.txtClr?? Colors.black,
        ),
        controller: widget.textCon,
        keyboardType: widget.inputType,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        onTap: (){
          if(widget.textCon.text=="0"){
            widget.textCon.clear();
          }
        },
        onEditingComplete: widget.onSubmitted,
        onSubmitted: widget.onEditStop,
        enabled: widget.enabledFlag,
        decoration: InputDecoration(
          filled: widget.enabledFlag != null ? true : widget.fillClr != null,
          fillColor: widget.enabledFlag != null && widget.enabledFlag == false
              ? widget.disableClr??const Color.fromRGBO(234, 234, 234, 1)
              : widget.fillClr,
          contentPadding: widget.maxLine !=null?const EdgeInsets.all(15):const EdgeInsets.only(left: 15),
          border: getInputBorder(),
          enabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon != null
              ? SizedBox(
            width: 20,
            height: 20,
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/${widget.prefixIcon!}.svg',
                fit: BoxFit.cover,
              ),
            ),
          )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: widget.txtSize ?? 16,
            // fontFamily: ConstantStrings.kFontFamily,
            color: Colors.grey.shade600,
            fontWeight: widget.txtFontWeight,
          ),
          suffixIcon: widget.suffixWidget != null
              ? widget.suffixWidget!
              : widget.isPassField != null
              ? IconButton(
            onPressed: () =>
                setState(() => obscureText = !obscureText),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey.shade600,
            ),
          )
              : null,
        ),
        onChanged: widget.onCngdFn,
        maxLines: widget.maxLine??1,
        inputFormatters: [],
      ),
    );
  }

  InputBorder getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.brdrRadius ?? 5.0),
      borderSide: BorderSide(
        color: widget.brdrClr ?? Colors.grey.shade400,
        width: 1,
      ),
    );
  }
}
