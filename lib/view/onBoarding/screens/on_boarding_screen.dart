import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';

import 'package:dobo/view/onBoarding/services/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (i) {
                  setState(() {
                    _pageIndex = i;
                  });
                },
                controller: _controller,
                itemCount: onBoardingcontents.length,
                itemBuilder: (context, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          onBoardingcontents[i].image,
                          height: 300,
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      SizedBox(
                        width: width * .70,
                        child: Text(
                          onBoardingcontents[i].content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColor.primary,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 4,
                activeDotColor: AppColor.primary,
              ),
              onDotClicked: (index) {},
            ),
            SizedBox(
              height: height * .05,
            ),
            PrimaryButton(
                onTap: () {
                  if (_pageIndex == 2) {
                    Navigator.pushNamed(context,RouteConstants.signInScreen);
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                label: 'Next'),
            GlobalVariabels.vertical15,
            GlobalVariabels.vertical15,
          ],
        ),
      ),
    );
  }
}
