import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g_projukti/feature/home/data/models/sub_category_response_model.dart';
import 'package:g_projukti/feature/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/product_image_view.dart';

class ProductView extends StatefulWidget {
  static String routeName = '/product_view';

  const ProductView({
    super.key,
  });

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final HomeController _productCon = Get.find();
  late WebViewController _webViewCon;


  // this flag use to check if a product already added to the cart
  bool checkingFlag = true;
  bool isAddedtoCart = false;
  bool addedToWish = false;
  bool variantFlag = false;
  bool stockOutFlag = false;

  // 0 means Description
  int stickyIndex = 0;
  String productUrl = "";
  int cID = 0;

  int variantIndex = 0;

  // int storageIndex = 0;
  // int sColorIndex = 0;
  int availableStock = 1;
  int stockVariable = 0;
  bool isDescriptionLoaded = false;
  int sizeH = 0;

  late final Product product;


  @override
  void initState() {

    product = Get.arguments;


    Log.logger.e(productUrl);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadLocalHtml() async {
    String linkPrefix = '''
    <!DOCTYPE html>
    <html>
      <head>
     
       <style>
        ul {
          padding-left: 0; /* Remove default padding */
        }
        
        ul li {
          margin-left: 0; /* Remove default margin */
          font-size: 14px;
        }
      </style>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>''';
    String linkPostFix = '''
      </body>
    </html>
    ''';
    final url = Uri.dataFromString(
      linkPrefix + product.meta.description + linkPostFix,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    _webViewCon.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getProductDetails(),
      ),
    );
  }

  Widget getProductDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image of the product
          ProductImageView(
            productName: product.name,
            productUrl: product.canonical,
            initialImgUrl: product.images,
          ),
          // Product title, price, off, rating and wish button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // title
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // price
                RichText(
                  // Sale Price
                  text: TextSpan(
                    text:
                        "${AllMethods.getFormatedPrice(product.updatedSellingPrice)}  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    children: [
                      // Regular Price
                      TextSpan(
                        text: AllMethods.getFormatedPrice(
                          product.sellingPrice,
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // off, rating and wish button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (AllMethods.getOffPercentage(
                          salePrice: product.sellingPrice,
                          regularPrice: product.updatedSellingPrice,
                        ) !=
                        '0% OFF')
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 23,
                        width: 55,
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? AppColors.primaryColor.withOpacity(0.4)
                              : Colors.red.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            AllMethods.getOffPercentage(
                              salePrice: product.sellingPrice,
                              regularPrice: product.updatedSellingPrice,
                            ),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    // padding to center the icon
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    // rating
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 6, 2),
                      child: Text(
                        "${product.rating == 0 ? 5 : product.rating}",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // wish icon
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                      size: 22,
                    )
                  ],
                ),
                //Short Description
                // SizedBox(
                //   height: sizeH.toDouble(),
                //   child: WebView(
                //     javascriptMode: JavascriptMode.unrestricted,
                //     onWebViewCreated: (controller) {
                //       _webViewCon = controller;
                //       loadLocalHtml();
                //     },
                //   ),
                // ),
                AllMethods.buildWebView(
                  ConstantStrings.htmlPrefix +
                      product.meta.shortDescription +
                      ConstantStrings.htmlPostFix,
                ),
                if (product.sellWarranty > 0)
                  // warranty icon and title
                  Row(
                    children: [
                      Icon(
                        Icons.security_outlined,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${product.sellWarranty} ${product.sellWarrantyDurationType}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),

                Text('Description: ', style: context.textTheme.headlineMedium?.copyWith(color: Colors.black),),
                AllMethods.buildWebView(
                  ConstantStrings.htmlPrefix +
                      product.meta.description +
                      ConstantStrings.htmlPostFix,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

/* Widget buildStorageSelection() {
    return Column(
      children: [
        Container(
          height: 65,
          width: double.infinity,
          padding: EdgeInsets.only(left: 24),
          child: Column(
            children: [
              // Storages
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      "Storage",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Available Storage List
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _productCon.product.storage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => setState(() {
                            storageIndex = index;
                            sColorIndex = 0;
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: storageIndex == index
                                  ? Colors.deepPurple
                                  : ConstantColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                _productCon.product.storage[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              // Storage Colors
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      "Color",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Available Color List
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _productCon
                          .product.storage[storageIndex].color.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => setState(() => sColorIndex = index),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: sColorIndex == index
                                  ? Colors.deepPurple
                                  : ConstantColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                _productCon.product.storage[storageIndex]
                                    .color[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(thickness: 1),
      ],
    );
  } */
}

class TitleWidget extends StatelessWidget {
  TitleWidget({
    super.key,
    required this.title,
    this.fontSize,
  });

  final String title;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
