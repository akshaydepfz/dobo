import 'package:dobo/model/core/assets/app_assets.dart';

class OnBoardingContent {
  final String image;
  final String content;

  OnBoardingContent(this.image, this.content);
}

List<OnBoardingContent> onBoardingcontents = [
  OnBoardingContent(AppAssets.onBoarding1,
      'Thousands of doctors & experts to help your health!'),
  OnBoardingContent(AppAssets.onBoarding2,
      'Health checks & consultations easily anywhere anytime'),
  OnBoardingContent(AppAssets.onBoarding3,
      'Let’s start living healthy and well with us right now!'),
];
