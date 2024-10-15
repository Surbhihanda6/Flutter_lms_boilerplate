import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
