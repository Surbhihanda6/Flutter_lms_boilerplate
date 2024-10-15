import 'package:logger/logger.dart';

import '../values/api_strings.dart';

class AppLogger {
  final logger = Logger();

  void logData(dynamic info) {
    if (ApiRoutes.currentEnvironment == Environment.prod) {
      return;
    }
    logger.i(info);
  }

  void logError(dynamic info) {
    if (ApiRoutes.currentEnvironment == Environment.prod) {
      return;
    }
    logger.e(info, error: 'Error');
  }
}
