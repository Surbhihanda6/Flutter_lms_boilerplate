import 'package:get/get.dart';

import '../values/strings.dart';

abstract class AppValidators {
  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return 'field_cant_be_empty'.tr;
    } else if (RegExp(r'[^\p{L}\p{N}]', unicode: true).hasMatch(v)) {
      return null;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final emailRegex = RegExp(pattern);
    if (v == null || v.trim().isEmpty) {
      return Strings.pleaseEnterEmailId;
    } else if (!emailRegex.hasMatch(v)) {
      return Strings.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? v, {bool canValidateNumber = false}) {
    if (!canValidateNumber) {
      return null;
    }
    if (v?.isEmpty ?? false) {
      return 'Please enter your mobile number'.tr;
    }
    if (v != null &&
        v.isNotEmpty &&
        v.length == 10 &&
        (int.parse(v[0]) >= 6 && int.parse(v[0]) <= 9)) {
      return null;
    } else {
      return Strings.enterValidNumber;
    }
  }
}
