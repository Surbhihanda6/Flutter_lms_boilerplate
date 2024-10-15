import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
