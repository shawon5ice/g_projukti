import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';


class CustomDropDownWidget extends StatelessWidget {
  final void Function(dynamic) getMethods;
  double? ddWidth;
  final String hintTxt;
  dynamic value;
  bool? isFilled;
  final List<DropdownMenuItem<dynamic>> items;

  CustomDropDownWidget({
    super.key,
    required this.hintTxt,
    required this.items,
    this.ddWidth,
    this.value,
    this.isFilled,
    required this.getMethods,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ddWidth ?? double.infinity,
      child: DropdownButtonFormField2<dynamic>(
        isDense: true,
        decoration: dropDownDecoration(filled: isFilled ?? false, context: context),
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Text(
                hintTxt,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.kC0C0C4
                      : Colors.grey.shade600,
                  fontSize: 12,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        items: items,
        value: value,
        onChanged: getMethods,
        // iconStyleData: IconStyleData(
        //   icon: SvgPicture.asset('assets/svg/down.svg',height: 12.h,width: 12.w,),
        // ),
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent)
          )
        ),
        dropdownStyleData: DropdownStyleData(
          width: ddWidth ?? double.infinity,
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 2)
        ),
      ),
    );
  }
}

InputDecoration dropDownDecoration({required bool filled, required BuildContext context}) {
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: context.isDarkMode
          ? const Color(0xff1f2225)
          : const Color(0xffe8eaed),
      filled: filled);
}

DropdownMenuItem<dynamic> dropdownMenuItem2(dynamic item, String txt) {
  return DropdownMenuItem(
    value: item,
    child: DropDownItemWidget(txt: txt),
  );
}

class DropDownItemWidget extends StatelessWidget {
  const DropDownItemWidget({super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        txt,
        // overflow: TextOverflow.,
        style: TextStyle(
          fontSize: 12,
          color: context.isDarkMode
              ? AppColors.kC0C0C4
              : Colors.black,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}