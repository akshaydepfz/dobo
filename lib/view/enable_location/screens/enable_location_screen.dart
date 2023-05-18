import 'dart:io';

import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

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
            PrimaryButton(
                onTap: () async {
                  final location = await Permission.location.request();
                  final locationAlways =
                      await Permission.locationAlways.request();
                  if (await Permission.location.request().isGranted) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, RouteConstants.locationSelect);
                  } else if (Platform.isIOS) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, RouteConstants.locationSelect);
                  }
                },
                label: 'Enable Device Location'),
            GlobalVariabels.vertical15,
          ],
        ),
      ),
    );
  }
}
