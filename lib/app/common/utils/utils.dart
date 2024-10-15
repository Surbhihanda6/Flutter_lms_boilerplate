import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api_helper_impl.dart';

abstract class Utils {
  static Future<bool> isInternetConnected() async {
    try {
      final response = await AppNetworkService().hasInternetConnection();
      return response;
    } on Exception catch (_) {
      return false;
    }
  }

  static void showSnackbar(
    String? message, {
    bool isRequired = true,
    bool isError = false,
    bool isSuccess = false,
  }) {
    if (isRequired) {
      closeSnackbar();
      if (isError) {
        showErrorSnackBar(message);
        return;
      } else if (isSuccess) {
        showSuccessSnackBar(message);
        return;
      }
      Get.rawSnackbar(message: message);
    }
  }

  static void showErrorSnackBar(String? message) {
    Get.rawSnackbar(
      message: message,
      shouldIconPulse: false,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }

  static void showSuccessSnackBar(String? message) {
    Get.rawSnackbar(
      message: message,
      shouldIconPulse: false,
      // icon: SvgPicture.asset(
      //   width: 20.w,
      //   height: 20.h,
      //   AppAssets.svgs.successSnackBarSvg,
      // ),
    );
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }
}
