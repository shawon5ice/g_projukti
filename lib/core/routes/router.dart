import 'package:g_projukti/feature/home/presentation/ui/home_screen.dart';
import 'package:g_projukti/feature/home/presentation/ui/product_details_view.dart';
import 'package:g_projukti/feature/home/presentation/ui/sub_category_screen.dart';
import 'package:get/get.dart';
import '../../feature/splash/splash_screen.dart';
import 'bindings.dart';

class AppRoutes {
  static List<GetPage<dynamic>> allRoutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: HomeBinding()
    ),

    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding()
    ),

    GetPage(
        name: SubCategoryScreen.routeName,
        page: () => const SubCategoryScreen(),
        binding: HomeBinding()
    ),

    GetPage(
        name: ProductView.routeName,
        page: () => const ProductView(),
        binding: HomeBinding()
    ),
  ];
}
