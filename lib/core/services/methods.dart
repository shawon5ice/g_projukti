import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../core.dart';
class AllMethods {
  static Widget buildWebView(String htmlString) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      child: HtmlWidget(
        htmlString,
        onLoadingBuilder: (
            context,
            element,
            loadingProgress,
            ) =>
        const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static launchOnlyUrl(String url) async {
    // print("This is the url: " + ConstantStrings.webLink + url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showSnackBar(
        title: "Unable to Open!",
        message: "Something went wrong during this process!",
        icon: Icons.info_outline,
      );
    }
  }

  static void launcCaller({required String phoneNo}) async {
    String url = "tel:" + phoneNo;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showSnackBar(
        title: "Unable to call!",
        message: "Something went wrong during the call!",
        icon: Icons.info_outline,
      );
    }
  }

  static void showSnackBar({
    required String title,
    required String message,
    required IconData icon,
    Color? bgColor,
    Color? txtColor,
    bool? isTop,
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      backgroundColor: bgColor,
      title,
      message,
      colorText: txtColor,
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      snackPosition: isTop != null ? SnackPosition.TOP :SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 300),
      duration: Duration(seconds: isTop != null? 3 :2),
      margin: const EdgeInsets.all(20),
    );
  }

  // wish page function
  static String getFormatedPrice(num value) {
    return '৳' + NumberFormat('#,##,000').format(value);
  }

  static String getFormattedDate(String date) {
    return date.substring(0, 10);
  }

  static Color getOrderStatusColor({required String status}) {
    switch (status) {
      case 'Pending':
        return AppColors.sPendingC;
      case 'Processing':
        return AppColors.sProcessingC;
      case 'Unpaid':
        return AppColors.sUnpaidC;
      case 'Paid':
        return AppColors.sPaidC;
      case 'Cash On Delivery':
        return AppColors.sCashOnDeliveryC;
      case 'Picked':
        return AppColors.sPickedC;
      case 'Ready To Ship':
        return AppColors.sReadyToShipC;
      case 'Delivered':
        return AppColors.sDeliveredC;
      case 'Cancelled':
        return AppColors.sCancelledC;
      case 'Refunded':
        return AppColors.sRefundedC;
      case 'Refund Requested':
        return AppColors.sRefundReqC;
      default:
        return const Color(0xFFF38E8E);
    }
  }

  static String getSelectedPaymentName(int selectedPaymentFn) {
    switch (selectedPaymentFn) {
      case 0:
        return "COD";
      case 1:
        return "BKASH";
      case 2:
        return "NAGAD";
      case 3:
        return 'UPAY';
      case 4:
        return 'SSL';
      default:
        return "COD";
    }
  }

  static String getLogo(int index) {
    switch (index) {
      case 0:
        return 'assets/svg/warranty.svg';
      case 1:
        return 'assets/svg/privacy.svg';
      case 2:
        return 'assets/svg/emi.svg';
      case 3:
        return 'assets/svg/refund.svg';
      case 4:
        return 'assets/svg/terms_and_conditions.svg';
      default:
        return 'assets/svg/terms_and_conditions.svg';
    }
  }

  static String getOffPercentage({
    required num salePrice,
    required num regularPrice,
  }) {
    if(regularPrice==0 || salePrice ==0){
      return "0% OFF";
    }
    num offPrice = regularPrice - salePrice != 0 ? regularPrice - salePrice : 0;
    num percentage = ((offPrice / regularPrice) * 100).ceil();
    if(percentage<1){
      return "0% OFF";
    }
    return "$percentage% OFF";
  }


  // Image Uploading Methods
  static Widget buildDPAlertDialog({
    required Future<void> Function(bool) onPressedFn,
    required BuildContext ctx,
  }) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10),
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 30),
      backgroundColor: Colors.transparent,
      title: Container(
        height: 125,
        width: MediaQuery.of(ctx).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Camera",
              galleryFlag: false,
            ),
            Divider(indent: 20, endIndent: 20, thickness: 1),
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Choose from gallery",
              galleryFlag: true,
            ),
          ],
        ),
      ),
      content: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor:
          MaterialStateProperty.all(AppColors.primaryColor),
          fixedSize: MaterialStateProperty.all(Size(354, 60)),
        ),
        onPressed: () {
          Get.back();
        },
        child: Text(
          "Cancel",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  static TextButton buildImgSelectBtn({
    required Future<void> Function(bool) onPressedFn,
    required String title,
    required bool galleryFlag,
  }) {
    return TextButton(
      onPressed: () async {
        onPressedFn(galleryFlag);
        Get.back();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(354, 54)),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
