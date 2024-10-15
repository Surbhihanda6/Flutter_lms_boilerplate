import 'package:flutter/material.dart';

class AppNavigation {
  AppNavigation._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> goNamed(appRoute) async {
    navigatorKey.currentState!.pushNamed(appRoute);
  }
}
