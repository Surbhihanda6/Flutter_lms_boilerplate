import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/common/utils/initializer.dart';
import 'app/data/services/navigation_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  Initializer.init(
    () => runApp(
      const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, __) {
        // Determine the design size based on the device type
        final Size designSize = MediaQuery.of(context).size.shortestSide < 600
            ? const Size(360, 640) // Mobile design size
            : const Size(768, 1024); // Tablet design size

        return GetMaterialApp(
          initialRoute: Routes.SPLASH,
          debugShowCheckedModeBanner: false,
          navigatorKey: AppNavigation.navigatorKey,
          getPages: AppPages.routes,
          // theme: AppTheme.theme,
          builder: (context, widget) {
            ScreenUtil.init(context, designSize: designSize);
            return widget!;
          },
        );
      },
    );
  }
}
