import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/storage/storage.dart';
import '../../../common/values/app_assets.dart';
import '../../../routes/app_pages.dart';
import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {
  final List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      title: 'Experience Endless Opportunities',
      description:
          'provide a variety of features and benefits through video lectures to enhance the learning experience.',
      imagePath: AppAssets.svgs.onboardingImage1,
    ),
    OnboardingModel(
      title: 'Live Lectures',
      description:
          'provide a variety of features and benefits through video lectures to enhance the learning experience.',
      imagePath: AppAssets.svgs.onboardingImage2,
    ),
    OnboardingModel(
      title: 'Quiz & Capstone',
      description:
          'provide a variety of features and benefits through video lectures to enhance the learning experience.',
      imagePath: AppAssets.svgs.onboardingImage3,
    ),
  ];

  void navigateToLogin() {
    Get.offNamed(Routes.LOGIN);
    AppStorage.saveValue(StorageKeys.onboardingCompleted, "true");
  }
}
