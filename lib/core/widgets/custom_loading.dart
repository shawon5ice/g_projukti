import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoading extends StatelessWidget {
  double? borderRadius;
  EdgeInsets? containerMargin;

  CustomLoading({
    super.key,
    this.borderRadius,
    this.containerMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Container(
        margin: containerMargin,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          color: Colors.grey,
        ),
      ),
    );
  }
}
