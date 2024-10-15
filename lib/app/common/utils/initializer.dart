import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/api_helper_impl.dart';
import '../../data/interface_controller/api_interface_controller.dart';
import '../../modules/widgets/scaffold/app_scaffold_controller.dart';

abstract class Initializer {
  static void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await initServices();
      runApp();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> initServices() async {
    try {
      InitialBindings().dependencies();

      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppScaffoldController>(AppScaffoldController());
    Get.lazyPut<AppNetworkService>(() => AppNetworkService());
    Get.lazyPut<ApiInterfaceController>(() => ApiInterfaceController());
  }
}
