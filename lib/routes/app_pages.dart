import 'package:get/get.dart';
import 'package:media_dictionary/bindings/main_bindings.dart';
import 'package:media_dictionary/ui/home_page.dart';
import 'package:media_dictionary/ui/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: MainBindings(),
    ),
  ];
}
