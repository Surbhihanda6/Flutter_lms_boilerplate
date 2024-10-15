import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/utils/utils.dart';
import '../../../routes/app_pages.dart';
import '../service/login_service.dart';

enum SelectedLoginMethod { EMAIL, MOBILE }

class LoginController extends GetxController {
  final LoginService _loginService = LoginService();
  Rx<SelectedLoginMethod> selectedLoginMethod = SelectedLoginMethod.EMAIL.obs;
  final isLoading = false.obs;
  final mobileTextController = TextEditingController().obs;
  final emailTextController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  var dialCodes = ["+91", "+1", "+44", "+61"].obs;
  var selectedDialCode = "+91".obs;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  final otpFormKey = GlobalKey<FormState>();
  final currentText = "".obs;
  final hasError = false.obs;

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    mobileTextController.value.text = "";
    emailTextController.value.text = "";
    super.onInit();
  }

  @override
  void onReady() {
    errorController = StreamController<ErrorAnimationType>();
    mobileTextController.value.text = "";
    emailTextController.value.text = "";
    super.onReady();
  }

  void login() async {
    if (selectedLoginMethod.value == SelectedLoginMethod.EMAIL &&
        emailTextController.value.text.isEmpty) {
      Utils.showErrorSnackBar("Please enter a valid email address");
      return;
    } else if (selectedLoginMethod.value == SelectedLoginMethod.MOBILE &&
        mobileTextController.value.text.isEmpty) {
      Utils.showErrorSnackBar("Please enter a valid mobile number");
      return;
    }

    isLoading.value = true;

    try {
      final loginData = {
        if (selectedLoginMethod.value == SelectedLoginMethod.MOBILE)
          "dialCode": selectedDialCode.value,
        "platform": "USER",
        if (selectedLoginMethod.value == SelectedLoginMethod.EMAIL)
          "email": emailTextController.value.text
        else
          "mobile": mobileTextController.value.text,
      };

      bool isSuccess = await _loginService.login(loginData).whenComplete(() {
        isLoading.value = false;
      });

      if (isSuccess) {
        errorController = StreamController<ErrorAnimationType>();
        otpController.value = TextEditingController();
        Get.toNamed(Routes.OTP);
      }
    } on Exception catch (_) {
      isLoading.value = false;
    }
  }

  void verifyOtp() async {
    isLoading.value = true;

    try {
      final otpData = {
        "otp": otpController.value.text,
        if (selectedLoginMethod.value == SelectedLoginMethod.EMAIL)
          "email": emailTextController.value.text
        else
          "mobile": mobileTextController.value.text,
        if (selectedLoginMethod.value == SelectedLoginMethod.MOBILE)
          "dialCode": selectedDialCode.value,
      };

      bool isSuccess = await _loginService.verifyOtp(otpData).whenComplete(() {
        isLoading.value = false;
      });

      if (isSuccess) {
        errorController = StreamController<ErrorAnimationType>();
        otpController.value = TextEditingController();
        // Get.toNamed(Routes.);
      }
    } on Exception catch (_) {
      isLoading.value = false;
    }
  }

  void toggleLoginMethod() {
    mobileTextController.value.clear();
    emailTextController.value.clear();
    selectedLoginMethod.value =
        selectedLoginMethod.value == SelectedLoginMethod.EMAIL
            ? SelectedLoginMethod.MOBILE
            : SelectedLoginMethod.EMAIL;
  }

  void onTextValueChanged(String text) {
    if (selectedLoginMethod.value == SelectedLoginMethod.EMAIL) {
      emailTextController.value.text = text;
    } else {
      mobileTextController.value.text = text;
    }
  }

  void onBackPress() {
    // otpController.value.clear();
    errorController.close();
    Get.back();
  }
}
