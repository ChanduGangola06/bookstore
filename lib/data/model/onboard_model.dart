import 'package:bookstore/core/utils/image_constant.dart';

class ItemModel {
  String? bgimage;
  String? playerimage;
  String? title;
  String? subTitle;

  ItemModel(this.bgimage, this.playerimage, this.title, this.subTitle);
}

class OnboardModel {
  static List<ItemModel> getOnboardData() {
    return [
      ItemModel(
        ImageConstant.onboardingbg1,
        ImageConstant.onboardingbg1Player,
        "One-step solution to book",
        "The process of tracking a mobile number is straightforward a person can enter the phone number.",
      ),
      ItemModel(
        ImageConstant.onboardingbg2,
        ImageConstant.onboardingbg2Player,
        "Search ground want book",
        "He took me for a ride on his He gave me a ride on his had my first ride in a limousine",
      ),
      ItemModel(
        ImageConstant.onboardingbg3,
        ImageConstant.onboardingbg3Player,
        "Will get about tournament",
        "Some of the most common types of tournaments are Knock-out or Elimination Tournament",
      ),
    ];
  }
}
