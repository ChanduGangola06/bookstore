import 'package:flutter/material.dart';
import 'package:bookstore/core/app_export.dart';
import 'package:bookstore/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbuttonOne extends StatelessWidget {
  AppbarTrailingIconbuttonOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 48.adaptSize,
          width: 48.adaptSize,
          decoration: IconButtonStyleHelper.fillOnErrorContainer,
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup1171274871,
          ),
        ),
      ),
    );
  }
}
