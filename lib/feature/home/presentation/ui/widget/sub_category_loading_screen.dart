import 'package:flutter/material.dart';
import 'package:g_projukti/core/core.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryLoadingWidget extends StatelessWidget {
  const SubCategoryLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: MediaQuery.of(context).size.width>=380 ? 0.68: .64,),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12)
                  ),
                  border: Border.all(
                      color: Colors.grey.withOpacity(.5)),
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
                  ]),
              child: Shimmer(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey.shade50,
                      Colors.grey.shade700
                    ]),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Container(
                      height: 12,
                      color: Colors.grey,
                    ),
                    addH(5),
                    Container(
                      height: 12,
                      color: Colors.grey,
                    ),
                    addH(5),
                    Container(
                      height: 12,
                      color: Colors.grey,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}