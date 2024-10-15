import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lms_boilerplate/app/modules/login/view/otp_auth_view.dart';
import '../modules/login/bindings/login_bindings.dart';
import '../modules/login/view/login_view.dart';
import '../modules/onboarding/bindings/onboarding_bindings.dart';
import '../modules/onboarding/view/onboarding_view.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/view/splash_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpAuthView(),
      binding: LoginBindings(),
    ),
  ];
}
