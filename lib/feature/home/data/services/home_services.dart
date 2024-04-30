import '../../../../core/core.dart';

class HomeServices {
  static Future<dynamic> getCategory() async {
    var response =
        await ApiService.get(endpoint: ConstantStrings.homeCategoryUrl);
    return response;
  }

  static Future<dynamic> getSubCategory(
      {required String categorySlug, required int page}) async {
    var response = await ApiService.get(
        endpoint: ConstantStrings.subCategoryProductsListUrl,
        queryParameters: {
          "category__slug": categorySlug,
          "page_size": 10,
          "page": page
        });
    return response;
  }
}
