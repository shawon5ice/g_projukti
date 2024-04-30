import 'dart:isolate';

import 'package:g_projukti/feature/home/data/models/sub_category_response_model.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../data/models/category_model_response.dart';
import '../../data/services/home_services.dart';

class HomeController extends GetxController {
  bool categoryLoading = false;
  bool subCategoryLoading = false;
  bool subCategoryLoadingMore = false;
  bool categoryFetchSuccess = false;
  bool subCategoryFetchSuccess = false;
  late SubCategoryResponseModel subCategoryResponseModel;
  List<Categories> categories = [];
  List<Product> subCategoryProductsList = [];

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    categoryLoading = true;
    update(['category']);
    try {
      var response = await HomeServices.getCategory();
      Log.logger.d(response);

      if (response != null) {
        CategoryModelResponse categoryModelResponse =
            await startParsing(response);
        categoryFetchSuccess = categoryModelResponse.success;
        if (categoryFetchSuccess) {
          categories.addAll(categoryModelResponse.data.first.categories);
        }
      }
    } finally {
      categoryLoading = false;
      update(['category']);
    }
  }

  Future<CategoryModelResponse> startParsing(dynamic response) async {
    final resultPort = ReceivePort();
    await Isolate.spawn(
      parseJson,
      [resultPort.sendPort, response],
    );
    return await (resultPort.first);
  }

  static parseJson(List<dynamic> args) async {
    SendPort resultPort = args[0];
    var json = args[1];

    CategoryModelResponse categories =
        await CategoryModelResponse.fromJson(json);

    Isolate.exit(resultPort, categories);
  }

  void getSubCategory({required String categorySlug, required int page}) async {
    if (page == 1) {
      subCategoryFetchSuccess = false;
      subCategoryLoading = true;
      subCategoryProductsList.clear();
    } else {
      subCategoryLoadingMore = true;
    }
    update(['sub_category']);
    try {
      var response = await HomeServices.getSubCategory(
          categorySlug: categorySlug, page: page);
      Log.logger.d(response);

      if (response != null) {
        subCategoryResponseModel =
            await startParsingSubCategory(response);
        subCategoryFetchSuccess = subCategoryResponseModel.success??false;
        if (subCategoryFetchSuccess) {
          if (subCategoryResponseModel.data != null) {
            subCategoryProductsList
                .addAll(subCategoryResponseModel.data!.products);
          }
        }
      }
    } finally {
      subCategoryLoading = false;
      subCategoryLoadingMore = false;
      update(['sub_category']);
    }
  }

  Future<SubCategoryResponseModel> startParsingSubCategory(
      dynamic response) async {
    final resultPort = ReceivePort();
    await Isolate.spawn(
      parseSubCategoryJson,
      [resultPort.sendPort, response],
    );
    return await (resultPort.first);
  }

  static parseSubCategoryJson(List<dynamic> args) async {
    SendPort resultPort = args[0];
    var json = args[1];

    SubCategoryResponseModel categories =
        await SubCategoryResponseModel.fromJson(json);

    Isolate.exit(resultPort, categories);
  }
}
