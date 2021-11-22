import 'package:get/get.dart';
import 'package:media_dictionary/controller/main_controller.dart';
import 'package:media_dictionary/controller/splash_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => SplashController());
  }
}
