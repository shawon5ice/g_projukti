import 'package:flutter/material.dart';
import 'package:g_projukti/core/widgets/triangle.dart';
import 'package:get/get.dart';

class CustomCheckButton extends StatelessWidget {
  final bool checked;
  final Color bgColor;
  final Color borderColor;
  final String title;
  final Function(bool) onChanged;

  const CustomCheckButton({
    Key? key,
    required this.checked,
    required this.title,
    required this.bgColor,
    required this.borderColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!checked);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor,width: 1),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(alignment: Alignment.center, child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: context.isDarkMode
                  ? Colors.black45
                  : Colors.black,),)),
              if(checked)Positioned(
                right: 0,
                top: 0,
                child: CustomPaint(
                  painter: TrianglePainter(),
                  size: const Size(30, 20),
                ),
              ),
              if(checked)const Positioned(
                right:2,
                top: 0,
                child: Icon(Icons.check, size: 12,color: Colors.white,),),
            ],
          ),
        ),
      ),
    );
  }
}