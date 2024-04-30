import 'package:flutter/material.dart';
import 'package:g_projukti/core/constants/app_colors.dart';
import 'package:g_projukti/core/constants/variables.dart';
import 'package:g_projukti/core/core.dart';
import 'package:g_projukti/feature/home/data/models/sub_category_response_model.dart';
import 'package:g_projukti/feature/home/presentation/controller/home_controller.dart';
import 'package:g_projukti/feature/home/presentation/ui/widget/category_loading_widget.dart';
import 'package:g_projukti/feature/home/presentation/ui/widget/full_screen_no_data_widget.dart';
import 'package:get/get.dart';

import 'product_details_view.dart';
import 'widget/product_card_design.dart';
import 'widget/sub_category_loading_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  static const String routeName = '/sub_category_screen';

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  late String appBarTitle;
  late String categorySlug;

  HomeController homeController = Get.find();

  @override
  void initState() {
    var args = Get.arguments as List;

    appBarTitle = args[0];
    categorySlug = args[1];
    homeController.getSubCategory(categorySlug: categorySlug, page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(appBarTitle),
        centerTitle: true,
        titleTextStyle: context.textTheme.headlineSmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            id: 'sub_category',
            builder: (controller) {
              if (controller.subCategoryLoading) {
                return const SubCategoryLoadingWidget();
              } else if (controller.subCategoryProductsList.isEmpty) {
                return const FullScreenNoDataFoundWidget();
              }
              return Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: PagerGridView<Product>(
                      items: controller.subCategoryProductsList,
                      isLoading: controller.subCategoryLoadingMore,
                      totalSize: controller.subCategoryResponseModel.metaData!.total,
                      totalPage: (controller.subCategoryResponseModel.metaData!.total / 10).ceil(),
                      onNewLoad: (p0, page) {
                        controller.getSubCategory(
                            categorySlug: categorySlug, page: page);
                      },
                      itemPerPage: 10,
                      itemBuilder: (context, item) {
                        return ProductCardDesign(
                          product: item,
                        );
                      },
                    )),
              );
            },
          )
        ],
      ),
    );
  }
}
