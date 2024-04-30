import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g_projukti/core/core.dart';

import '../constants/app_colors.dart';

typedef PagerWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class PagerGridView<T> extends StatelessWidget {
  final PagerWidgetBuilder<T> itemBuilder;
  final List<T> items;
  final bool isLoading;
  final _scrollController = ScrollController();
  final Function(List<T>, int) onNewLoad;
  final int totalPage;
  final int totalSize;
  final int itemPerPage;

  PagerGridView(
      {super.key,
      required this.items,
      required this.itemBuilder,
      required this.isLoading,
      required this.onNewLoad,
      required this.totalPage,
      required this.totalSize,
      required this.itemPerPage});

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (isLoading || totalPage == 1 || totalSize <= itemPerPage) return;

      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels > 0) {
        int newLength = totalSize % itemPerPage == 0
            ? (totalSize - 1) - items.length
            : totalSize - items.length;
        if (newLength > itemPerPage) {
          int nextPage = totalPage - (newLength / itemPerPage).floor();
          onNewLoad(items, nextPage);
        } else {
          if (newLength <= 0) return;
          onNewLoad(items, totalPage);
        }
      }
    });

    return Column(
      mainAxisAlignment: isLoading?MainAxisAlignment.end:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: GridView.count(
            controller: _scrollController,
            addAutomaticKeepAlives: true,
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            primary: false,
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.width>=380 ? 0.68: .64,
            children: items.map((e) {
              return itemBuilder(context, e);
            }).toList(),
          ),
        ),
        isLoading
            ?

        // SizedBox(
        //   height: .28.sh,
        //       child: Row(
        //           children: [
        //             Expanded(
        //               flex: 1,
        //               child: SizedBox(
        //                 height: .28.sh,
        //                 child: CustomLoading(
        //                   conMargin: EdgeInsets.symmetric(horizontal: 5.w),
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: SizedBox(
        //                 height: .28.sh,
        //                 child: CustomLoading(
        //                   conMargin: EdgeInsets.symmetric(horizontal: 5.w),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //     )

            Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: SizedBox(
                  height: 80,
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
              )
            : const SizedBox(),
      ],
    );
  }
}
