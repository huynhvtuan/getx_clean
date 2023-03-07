import 'package:get/get.dart';

import '../../presentation/feature/home/bindings/home_binding.dart';
import '../../presentation/feature/home/views/home_view.dart';
import '../../presentation/feature/home_detail/bindings/home_detail_binding.dart';
import '../../presentation/feature/home_detail/views/home_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DETAIL,
      page: () => const HomeDetailView(),
      binding: HomeDetailBinding(),
    ),
  ];
}
