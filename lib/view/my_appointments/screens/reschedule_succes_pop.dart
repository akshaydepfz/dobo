import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RescheduleSuccessPop extends StatelessWidget {
  final String date;

  const RescheduleSuccessPop({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          GlobalVariabels.vertical15,
          GlobalVariabels.vertical15,
          Expanded(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                      height: height * .20,
                      child: SvgPicture.asset(AppAssets.shield)),
                ),
                GlobalVariabels.vertical15,
                const Text(
                  'Reschedule Success',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GlobalVariabels.vertical15,
                Text(
                  'Your appointment reschedule on\n$date',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.grey4,
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LandingScreen()));
              },
              label: 'Done'),
          GlobalVariabels.vertical15,
        ],
      )),
    );
  }
}
