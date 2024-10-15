import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../common/values/app_colors.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final Function? onBackPress;
  final bool inAsyncCall;
  final bool isBackEnabled;
  final Color? statusBarColor;

  const AppScaffold({
    required this.body,
    this.inAsyncCall = false,
    this.isBackEnabled = true,
    super.key,
    this.onBackPress,
    this.statusBarColor,
  });

  @override
  AppScaffoldState createState() => AppScaffoldState();
}

class AppScaffoldState extends State<AppScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (!widget.isBackEnabled && widget.onBackPress != null) {
          widget.onBackPress!();
          return false;
        }
        return widget.isBackEnabled;
      },
      child: ModalProgressHUD(
        inAsyncCall: widget.inAsyncCall,
        child: Scaffold(
          backgroundColor: widget.statusBarColor ?? AppColors.primaryBlue00,
          body: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.h,
              top: 20.h,
              bottom: 15.h,
            ),
            child: widget.body,
          ),
        ),
      ),
    );
  }
}
