import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'Add Location'),
            GlobalVariabels.vertical15,
            GlobalVariabels.vertical15,
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                        height: height * .20,
                        child: SvgPicture.asset(AppAssets.locationShield)),
                  ),
                  GlobalVariabels.vertical15,
                  const Text(
                    'Dont Have Your Location Yet!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GlobalVariabels.vertical15,
                  const Text(
                    'Set your location to start booking\nClinics near you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.grey4,
                    ),
                  )
                ],
              ),
            ),
            PrimaryButton(onTap: () {}, label: 'Enable Device Location'),
            GlobalVariabels.vertical15,
          ],
        ),
      ),
    );
  }
}
