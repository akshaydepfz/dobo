import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingFailPop extends StatelessWidget {
  const BookingFailPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * .12, bottom: height * .05),
                child: SizedBox(
                    height: height * .20,
                    child: SvgPicture.asset(AppAssets.bookingFail)),
              ),
            ),
            const Text(
              'Oops, Failed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Appointment failed. Please check\n your internet connection then\n try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.grey4,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(onTap: () {}, label: 'Try Again'),
            SecondaryButton(onTap: () {}, label: 'Cancel'),
          ],
        ),
      ),
    );
  }
}
