import 'package:app_links/app_links.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../storage/storage.dart';

class AppLinkUtil {
  AppLinkUtil._();
  static final AppLinks _appLinks = AppLinks();
  // static bool _isInitialLinkHandled = false;

  static Future<void> setupAppLinks() async {
    _appLinks.stringLinkStream.listen((uri) async {
      await parseDeepLink(uri.toString());
    });

    // if (!_isInitialLinkHandled) {
    // Check if the initial link has been handled
    final Uri? initialAppLink = await _appLinks.getInitialLink();
    if (initialAppLink != null) {
      // _isInitialLinkHandled = true;
      await parseDeepLink(initialAppLink.toString());
    }
    // }
  }

  static Future<void> parseDeepLink(String url) async {
    // Parse the URL
    Uri uri = Uri.parse(url);

    // Access query parameters
    // String? afDeeplink = uri.queryParameters['af_deeplink'];
    // String? afDp = uri.queryParameters['af_dp'];
    // String? afXp = uri.queryParameters['af_xp'];
    // String? campaign = uri.queryParameters['campaign'];
    String? screenType = uri.queryParameters['screen_type'];
    // String? mediaSource = uri.queryParameters['media_source'];
    // String? shortlink = uri.queryParameters['shortlink'];
    // String? sourceCaller = uri.queryParameters['source_caller'];
    if (await AppStorage.getValue(StorageKeys.isUserLoggedIn) == 'true' &&
        screenType != null) {
      // switch (screenType) {
      //   case "helpdesk":
      //     _navigateToRouteWithCheck(
      //       Routes.HELP_DESK_VIEW,
      //     );
      //     return;
      //   case "notification":
      //     _navigateToRouteWithCheck(
      //       Routes.NOTIFICATION_CATEGORY_VIEW,
      //     );
      //     return;
      //   case "dashboard":
      //     _navigateToRouteWithCheck(
      //       Routes.AGENT_CUSTOMER_DASHBOARD,
      //     );
      //     return;
      // }
    }

    if (screenType != null) {
      AppStorage.saveValue(StorageKeys.deepLinkScreenType, screenType);
    }
    // Print or use the parameters as needed
    // print('af_deeplink: $afDeeplink');
    // print('af_dp: $afDp');
    // print('af_xp: $afXp');
    // print('campaign: $campaign');
    // print('screenType: $screenType');
    // print('media_source: $mediaSource');
    // print('shortlink: $shortlink');
    // print('source_caller: $sourceCaller');
  }

  // ignore: unused_element
  static void _navigateToRouteWithCheck(String routeName) {
    String currentRoute = Get.currentRoute;
    if (currentRoute != routeName) {
      Get.toNamed(routeName);
    }
  }
}
