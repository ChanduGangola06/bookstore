import 'package:bookstore/core/app_export.dart';
import 'package:bookstore/data/model/onboard_model.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  List<ItemModel> onboardingList = OnboardModel.getOnboardData();
  PageController pageController = PageController();
  Rx<int> sliderIndex = 0.obs;
  int currentPage = 0;

  void setCurrentPage(int value) {
    currentPage = value;
    update();
  }
}
