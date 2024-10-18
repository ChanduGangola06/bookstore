import 'package:bookstore/core/app_export.dart';
import 'package:bookstore/data/controller/onboarding_controller.dart';
import 'package:bookstore/data/model/onboard_model.dart';
import 'package:bookstore/presentation/login/login_screen.dart';
import 'package:bookstore/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
      child: Scaffold(
        backgroundColor: appTheme.secondarybgcolor,
        body: GetBuilder<OnboardingController>(builder: (controller) {
          return Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingList.length,
                onPageChanged: (value) {
                  controller.setCurrentPage(value);
                },
                itemBuilder: (context, index) {
                  ItemModel data = controller.onboardingList[index];
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data.bgimage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 57.v),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: data.playerimage,
                            height: 482.v,
                            width: 428.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 61.v),
                          Text(
                            data.title!,
                            style: theme.textTheme.headlineMedium!.copyWith(
                                color: appTheme.black900,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 31.h),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                data.subTitle!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: appTheme.black900,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32.v),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingList.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 8.v,
                            width: index == controller.currentPage ? 24.h : 8.v,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.h),
                                color: (index == controller.currentPage)
                                    ? appTheme.buttonColor
                                    : appTheme.black40),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 48.v),
                    CustomElevatedButton(
                      text: controller.currentPage ==
                              controller.onboardingList.length - 1
                          ? "Get Started"
                          : "lbl_next".tr,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      onPressed: controller.currentPage ==
                              controller.onboardingList.length - 1
                          ? () {
                              PrefUtils.setIsIntro(false);
                              Get.to(() => LoginScreen());
                            }
                          : () {
                              controller.pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceIn,
                              );
                            },
                    ),
                    SizedBox(height: 16.v),
                    GestureDetector(
                      onTap: () {
                        PrefUtils.setIsIntro(false);
                        onTapTxtSkip();
                      },
                      child: Text(
                        controller.currentPage ==
                                controller.onboardingList.length - 1
                            ? ""
                            : "lbl_skip".tr,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: appTheme.black900),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  onTapTxtSkip() {
    Get.to(() => LoginScreen());
  }
}
