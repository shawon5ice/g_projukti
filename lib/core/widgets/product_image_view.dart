import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g_projukti/core/widgets/sized_box_extention.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

import '../constants/app_colors.dart';

class ProductImageView extends StatefulWidget {
  static final GlobalKey<_ProductImageViewState> globalKey = GlobalKey();
  final String productUrl;
  final String productName;
  final String initialImgUrl;

  // final void Function(int) setImageByColorFn;
  ProductImageView({
    Key? key,
    required this.productUrl,
    required this.productName,
    required this.initialImgUrl,
    // required this.setImageByColorFn,
  }) : super(key: globalKey);

  @override
  _ProductImageViewState createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  final PageController _pageCon = PageController(
    initialPage: 0,
  );
  int totalCartItems = 0;

  @override
  void initState() {
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Product Main Image View, Back, Cart and Share Button
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          height: 300,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              // main image
              InkWell(
                onTap: () => _openImageView(context, widget.initialImgUrl),
                child: ClipRRect(
                  child: Image.network(
                    widget.initialImgUrl,
                    loadingBuilder: (context, child, progress) =>
                        progress == null
                            ? child
                            : Center(
                                child: CircularProgressIndicator(
                                  value: progress.expectedTotalBytes != null
                                      ? progress.cumulativeBytesLoaded /
                                          progress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 300,
                      ),
                    ),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // back button
              Positioned(
                left: 16,
                top: 26,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              // cart
              Padding(
                padding: EdgeInsets.only(
                  right: 16,
                  top: 16,
                ),
                child: // cart icon
                    InkWell(
                  onTap: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: SizedBox(
                    height: 45,
                    width: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.add_shopping_cart),
                      ],
                    ),
                  ),
                ),
              ),
              // share button
              Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  top: 55,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Share.share(
                      'You are going to share ${widget.productName}\n${widget.productUrl}'),
                  child: Icon(Icons.share),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _openImageView(
    BuildContext context,
    String imgUrl,
  ) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 896,
        width: 414,
        child: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(
                imgUrl,
              ),
              loadingBuilder: (context, imageChunk) => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.webp',
                      key: const Key("home5"),
                      height: 40,
                    ),
                    addW(50),
                    SpinKitRipple(
                      color: AppColors.primaryColor,
                      size: 50,
                      duration: const Duration(milliseconds: 1500),
                      borderWidth: 3,
                    ),
                  ],
                ),
              ),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              errorBuilder: (context, error, stackTrace) {
                return const Text("Error Occured!");
              },
            ),
            Positioned(
              left: 16,
              top: 26,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
