import 'package:flutter/material.dart';
import 'package:g_projukti/core/constants/variables.dart';
import 'package:get/get.dart';

import '../../../../../core/core.dart';
import '../../../data/models/sub_category_response_model.dart';
import '../product_details_view.dart';

class ProductCardDesign extends StatefulWidget {
  final Product product;

  const ProductCardDesign({
    super.key,
    required this.product,
  });

  @override
  State<ProductCardDesign> createState() => _ProductCardDesignState();
}

class _ProductCardDesignState extends State<ProductCardDesign> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.e('click');
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              // Image, Title & Prices
              InkWell(
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.toNamed(ProductView.routeName, arguments: widget.product);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        height: context.width > 400 ? 120 : 100,
                        width: context.width > 400 ? 300 : double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Image.network(
                          widget.product.images,
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
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Title, Price
                      addH(5),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Title
                            Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    widget.product.name,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      letterSpacing: -.2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: // add to wish button
                                      InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {},
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Prices
                            _getPriceView(
                              widget.product.isUpcoming ? 1: 0
                            ),
                            SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // top right off design
              if (AllMethods.getOffPercentage(
                    salePrice: widget.product.sellingPrice,
                    regularPrice: widget.product.updatedSellingPrice,
                  ) !=
                  '0% OFF')
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        AllMethods.getOffPercentage(
                          salePrice: widget.product.updatedSellingPrice,
                          regularPrice: widget.product.sellingPrice,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              // Rating
              Positioned(
                bottom: 4,
                left: 10,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '${widget.product.rating == 0? 5 : widget.product.rating}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // add to cart icon
              _getCartIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPriceView(int type) {
    switch (type) {
      case 0:
      case 2:
        return RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // Sale Price
          text: TextSpan(
            text: '${AllMethods.getFormatedPrice(widget.product.updatedSellingPrice)}  ',
            style: TextStyle(
              color: context.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            children: [
              // Regular Price
              if (widget.product.sellingPrice != widget.product.updatedSellingPrice)
                TextSpan(
                  text:
                      AllMethods.getFormatedPrice(widget.product.sellingPrice),
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 11,
                  ),
                ),
            ],
          ),
        );
      case 1:
        return const Text(
          "Coming Soon",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        );
      default:
        return RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // Sale Price
          text: TextSpan(
            text: AllMethods.getFormatedPrice(widget.product.updatedSellingPrice) + '  ',
            style: TextStyle(
              color: context.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            children: [
              // Regular Price
              TextSpan(
                text: AllMethods.getFormatedPrice(widget.product.sellingPrice),
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _getCartIcon() {
    return Positioned(
      bottom: 0,
      child: !widget.product.isCartDisabled
          ? Container(
        width: 100,
            height: 30,
            child: InkWell(
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {},
              ),
          )
          : const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: 70,
                child: Text(
                  "Stock Out!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
    );
  }
}
