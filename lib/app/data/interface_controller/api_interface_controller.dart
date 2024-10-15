import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../common/models/api_error_model.dart';

class ApiInterfaceController extends GetxController {
  ApiErrorModel? error;

  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
