import 'package:bookstore/core/app_export.dart';
import 'package:bookstore/presentation/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  nextPage() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAll(() => const OnboardScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 11.v),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder50,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup2,
                    height: 76.v,
                    width: 68.h,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 20.v),
                Text(
                  "msg_playground_booking".tr,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
