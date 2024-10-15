import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lms_boilerplate/app/common/utils/exports.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/utils/app_validators.dart';
import '../../../common/values/app_assets.dart';
import '../../widgets/buttons/app_primary_button.dart';
import '../../widgets/scaffold/app_scaffold_view.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        inAsyncCall: controller.isLoading.value,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: Center(
                    child: Image.asset(AppAssets.pngs.splashScreenLogo),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome to Digital Regenesys",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.selectedLoginMethod.value ==
                              SelectedLoginMethod.EMAIL
                          ? "Verify Your Email Address For Login, We'll send you 6 digit verification code on your Email address"
                          : "Verify Your Mobile Number For Login, We'll send you 6 digit verification code on your Mobile Number",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      controller.selectedLoginMethod.value ==
                              SelectedLoginMethod.EMAIL
                          ? "Enter your Email ID"
                          : "Enter your Mobile No.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        if (controller.selectedLoginMethod.value ==
                            SelectedLoginMethod.MOBILE)
                          Expanded(
                            flex: 2,
                            child: DropdownButton<String>(
                              value: controller.selectedDialCode.value,
                              items: controller.dialCodes.map((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(code),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.selectedDialCode.value = newValue!;
                              },
                            ),
                          ),
                        Expanded(
                          flex: controller.selectedLoginMethod.value ==
                                  SelectedLoginMethod.MOBILE
                              ? 10
                              : 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: controller.selectedLoginMethod.value ==
                                      SelectedLoginMethod.EMAIL
                                  ? "Enter your email address"
                                  : "",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.secondaryPink100,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.secondaryPink100,
                                ),
                              ),
                              // counterText: "", // Hide the max length counter
                            ),
                            maxLength: controller.selectedLoginMethod.value ==
                                    SelectedLoginMethod.MOBILE
                                ? 10
                                : 254,
                            validator: (v) {
                              return controller.selectedLoginMethod.value ==
                                      SelectedLoginMethod.EMAIL
                                  ? AppValidators.validateEmail(v)
                                  : AppValidators.validatePhone(v);
                            },
                            inputFormatters: [
                              controller.selectedLoginMethod.value ==
                                      SelectedLoginMethod.EMAIL
                                  ? FilteringTextInputFormatter.deny(
                                      RegExp(r'\s'),
                                    )
                                  : FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (text) {
                              controller.onTextValueChanged(text);
                            },
                            controller: controller.selectedLoginMethod.value ==
                                    SelectedLoginMethod.MOBILE
                                ? controller.mobileTextController.value
                                : controller.emailTextController.value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AppPrimaryButton(
                      text: "Verify OTP",
                      color: AppColors.primaryBlue100,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          controller.toggleLoginMethod();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "or ",
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              controller.selectedLoginMethod.value ==
                                      SelectedLoginMethod.MOBILE
                                  ? "Login with Email"
                                  : "Login with Mobile Number",
                              style: TextStyle(
                                color: AppColors.primaryBlue100,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: Text(
                        "Need help? Our support team is here for you! Contact us at",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'lms.support@digitalregenesys.com',
                        );
                        if (await canLaunchUrl(
                          Uri.parse(emailLaunchUri.toString()),
                        )) {
                          await launchUrl(Uri.parse(emailLaunchUri.toString()));
                        } else {
                          // Handle the error
                          // print('Could not launch $emailLaunchUri');
                        }
                      },
                      child: Text(
                        "lms.support@digitalregenesys.com",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlue100,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
