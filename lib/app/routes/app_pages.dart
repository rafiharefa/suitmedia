// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/first_page/bindings/first_page_binding.dart';
import '../modules/first_page/views/first_page_view.dart';
import '../modules/second_page/bindings/second_page_binding.dart';
import '../modules/second_page/views/second_page_view.dart';
import '../modules/third_page/bindings/third_page_binding.dart';
import '../modules/third_page/views/third_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.FIRST_PAGE,
      page: () => const FirstPageView(),
      binding: FirstPageBinding(),
    ),
    GetPage(
      name: _Paths.SECOND_PAGE,
      page: () => const SecondPageView(),
      binding: SecondPageBinding(),
    ),
    GetPage(
      name: _Paths.THIRD_PAGE,
      page: () => const ThirdPageView(),
      binding: ThirdPageBinding(),
    ),
  ];
}
