import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model_response.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: buildBoxDecoration(),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(child: Image.network(category.logo)),
          const Spacer(),
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      border: Border.all(color: Colors.grey.withOpacity(.5)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(2, 2),
        ),
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(2, 2),
        ),
      ]);
}
