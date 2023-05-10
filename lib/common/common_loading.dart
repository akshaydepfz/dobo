import 'package:dobo/core/assets/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoadingWidget extends StatelessWidget {
  const CommonLoadingWidget({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Loading..'),
            SizedBox(
                height: width / 2,
                width: width / 2,
                child: LottieBuilder.asset(AppLottie.loading)),
          ],
        ),
      );
  }
}