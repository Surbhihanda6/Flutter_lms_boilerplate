import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../common/values/app_assets.dart';
import '../../widgets/scaffold/app_scaffold_view.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // AppAssets.pngs.regenesysBrandLogo;
    return AppScaffold(
      body: Center(
        child: Image.asset(AppAssets.pngs.splashScreenLogo),
      ),
    );
  }
}
