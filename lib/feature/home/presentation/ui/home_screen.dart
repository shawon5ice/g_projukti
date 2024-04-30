import 'package:flutter/material.dart';
import 'package:g_projukti/core/constants/app_colors.dart';
import 'package:g_projukti/feature/home/presentation/controller/home_controller.dart';
import 'package:g_projukti/feature/home/presentation/ui/sub_category_screen.dart';
import 'package:get/get.dart';

import '../../data/models/category_model_response.dart';
import 'widget/category_loading_widget.dart';
import 'widget/category_widget.dart';
import 'widget/full_screen_no_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('G Projukti'),
        centerTitle: true,
        titleTextStyle: context.textTheme.headlineSmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            id: 'category',
            builder: (controller) {
              if (controller.categoryLoading) {
                return const CategoryLoadingWidget();
              } else if (controller.categories.isEmpty) {
                return const FullScreenNoDataFoundWidget();
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: .75),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        Categories category = controller.categories[index];
                        return GestureDetector(
                            onTap: () {
                              Get.toNamed(SubCategoryScreen.routeName,
                                  arguments: [category.name, category.slug]);
                            },
                            child: CategoryWidget(category: category));
                      },
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
