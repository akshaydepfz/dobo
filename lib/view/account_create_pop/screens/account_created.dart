import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountCreatedPop extends StatelessWidget {
  const AccountCreatedPop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                  'Account created!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GlobalVariabels.vertical15,
                const Text(
                  'Your account has been creatd\nsuccessfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.grey4,
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(onTap: () {}, label: 'Done'),
          GlobalVariabels.vertical15,
        ],
      )),
    );
  }
}
