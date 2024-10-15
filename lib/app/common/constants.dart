// ignore_for_file: constant_identifier_names

abstract class StorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userDetail = 'user_details';
  static const String fcmToken = 'fcm_token';
  static const String deepLinkScreenType = 'deep_link_screen_type';
  static const String isUserLoggedIn = 'is_user_logged_in';
  static const String darkMode = 'dark_mode';
  static const String deviceMode = 'device_mode';
  static const String selectedLanguage = 'selected_language';
  static const String onboardingCompleted = 'onboarding_completed';
}

enum RequestType {
  GET,
  POST,
  PUT,
  PATCH,
}
