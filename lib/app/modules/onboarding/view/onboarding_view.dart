import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../controller/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Continue',
        onFinish: () {
          controller.navigateToLogin();
        },
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Colors.blue,
        ),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.sp,
          ),
        ),
        controllerColor: Colors.blue,
        totalPage: controller.onboardingItems.length,
        headerBackgroundColor: Colors.white,
        pageBackgroundColor: Colors.white,
        centerBackground: true,
        background: controller.onboardingItems.map((item) {
          return Center(child: SvgPicture.asset(item.imagePath));
        }).toList(),
        speed: 1.8,
        pageBodies: controller.onboardingItems.map((item) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 240.h),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
