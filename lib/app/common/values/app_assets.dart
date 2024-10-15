class _AppFonts {
  final String baseFontUrl = "assets/font/manrope.ttf";
}

// ignore_for_file: library_private_types_in_public_api

class _AppLottieAnimations {
  static const String _baseAppLottieAnimationsUrl = "assets/lottie_animations";

  final String splashAnimationJson =
      '$_baseAppLottieAnimationsUrl/splash_animation.json';

  ///add app animations here
  final String successTickAnimationJson =
      '$_baseAppLottieAnimationsUrl/success_tick_animation.json';

  final String splashTickAnimationJson =
      '$_baseAppLottieAnimationsUrl/splash_tick_animation.json';

  final String loaderAppreciateAnimationJson =
      '$_baseAppLottieAnimationsUrl/loader_appreciate_animation.json';

  final String coinLoaderAnimationJson =
      '$_baseAppLottieAnimationsUrl/coin_loader_animation.json';

  final String verificationSuccessCelebrationAnimationJson =
      '$_baseAppLottieAnimationsUrl/verification_success_celebration.json';
  final String panCardAnimationJson =
      'assets/lottie_animations/pan_card_animation.json';
  final String aadharLoaderAnimationJson =
      'assets/lottie_animations/aadhaar_loader.json';
  final String panLoaderAnimationJson =
      'assets/lottie_animations/pan_loader.json';
}

class _AppPngs {
  static const String _pngs = "assets/pngs";
  static const String _pngsCommon = "$_pngs/common";

  /// Common PNG
  final String commonIndianFlag = '$_pngsCommon/indian_flag.png';

  ///Splash Screen
  final String splashScreenLogo = "$_pngs/regenesys_brand_logo.png";
}

class _AppSvgs {
  static const String _baseSvgUrl = "assets/svgs";

  // static const String _baseAgentProfileUrl = "$_baseSvgUrl/agent_profile";

  ///add app svgs here
  final String loginBg = '$_baseSvgUrl/login_bg.svg';
  final String onboardingImage1 = '$_baseSvgUrl/onboarding_image_1.svg';
  final String onboardingImage2 = '$_baseSvgUrl/onboarding_image_2.svg';
  final String onboardingImage3 = '$_baseSvgUrl/onboarding_image_3.svg';
}

class _AppGifs {
  static const String _baseGifUrl = "assets/gifs";

  // static const String _baseAgentProfileUrl = "$_baseSvgUrl/agent_profile";

  ///add app gifs here
  final String otpGif = '$_baseGifUrl/otp.gif';
}

class AppAssets {
  AppAssets._();

  // Images
  static _AppPngs pngs = _AppPngs();

  // Svgs
  static _AppSvgs svgs = _AppSvgs();

  // Fonts
  static _AppFonts fonts = _AppFonts();

  static _AppGifs gifs = _AppGifs();

  // Lottie animations
  static _AppLottieAnimations lottie = _AppLottieAnimations();
}
