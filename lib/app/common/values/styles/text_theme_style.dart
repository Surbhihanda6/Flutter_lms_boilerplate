// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lms_boilerplate/app/common/utils/exports.dart';

abstract class TextThemeStyle {
  static TextTheme get textTheme => TextTheme(
        //h1
        displayLarge: TextStyle(
          fontSize: 95.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: -1.5,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //h2
        displayMedium: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.5,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //h3
        displaySmall: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //h4
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //h5
        headlineSmall: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //h6
        titleLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //subtitle1
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //subtitle2
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //body 1
        bodyLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //body 2
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //button
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.25,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //caption
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.4,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
        //overline
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.5,
          color: AppColors.textPrimary,
          fontFamily: 'Manrope',
        ),
      );
}

extension UIThemeExtension on BuildContext {
  TextStyle? get h1 => Theme.of(this).textTheme.displayLarge;

  TextStyle? get h2 => Theme.of(this).textTheme.displayMedium;

  TextStyle? get h3 => Theme.of(this).textTheme.displaySmall;

  TextStyle? get h4 => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get h5 => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get h6 => Theme.of(this).textTheme.titleLarge;

  TextStyle? get subtitle1 => Theme.of(this).textTheme.titleMedium;

  TextStyle? get subtitle2 => Theme.of(this).textTheme.titleSmall;

  TextStyle? get body1 => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get body2 => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get button => Theme.of(this).textTheme.labelLarge;

  TextStyle? get caption => Theme.of(this).textTheme.bodySmall;

  TextStyle? get small => Theme.of(this).textTheme.labelSmall;
}
