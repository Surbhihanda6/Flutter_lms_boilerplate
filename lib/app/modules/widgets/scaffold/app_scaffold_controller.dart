import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/values/app_colors.dart';

class AppScaffoldController extends GetxController {
  var isKeyboardOpen = false.obs;
  var isBackEnabled = true.obs;
  var inAsyncCall = false.obs;
  var statusBarColor = AppColors.primaryBlue00.obs;

  void setKeyboardOpen(bool value) {
    isKeyboardOpen.value = value;
  }

  void setBackEnabled(bool value) {
    isBackEnabled.value = value;
  }

  void setInAsyncCall(bool value) {
    inAsyncCall.value = value;
  }

  void setStatusBarColor(Color color) {
    statusBarColor.value = color;
  }
}
