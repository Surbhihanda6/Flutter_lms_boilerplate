import 'package:get/get.dart';
import 'package:lms_boilerplate/app/common/constants.dart';

import '../../../common/storage/storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _navigateToLogin();
    super.onInit();
  }

  void _navigateToLogin() {
    String selectedRoute = Routes.ONBOARDING;
    AppStorage.getValue(StorageKeys.onboardingCompleted).then((status) {
      if (status != null && status == "true") {
        selectedRoute = Routes.LOGIN;
      } else {
        selectedRoute = Routes.ONBOARDING;
      }
    });
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(selectedRoute);
    });
  }
}
