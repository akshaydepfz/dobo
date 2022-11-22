import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:flutter/material.dart';

class DoctorViewScreen extends StatelessWidget {
  const DoctorViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'The family care'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                AppAssets.doctor2,
                              )),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor.grey2)),
                          height: 100,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                          )),
                      GlobalVariabels.horizontal10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          IconTile(
                              title: 'Health care clinic',
                              icon: AppIcons.hospital),
                          GlobalVariabels.vertical10,
                          IconTile(
                              title: 'Dental Specialist', icon: AppIcons.medal),
                          GlobalVariabels.vertical10,
                          IconTile(
                              title: '08.00 AM - 04.30 PM',
                              icon: AppIcons.time),
                        ],
                      ),
                    ],
                  ),
                  GlobalVariabels.vertical15,
                  GlobalVariabels.vertical15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      RateReviewCard(
                          label: 'Patients',
                          icon: AppIcons.group,
                          count: '5,000+'),
                      SizedBox(
                        height: 60,
                        child: VerticalDivider(),
                      ),
                      RateReviewCard(
                          label: 'Rating', icon: AppIcons.star, count: '4.8'),
                      SizedBox(
                        height: 60,
                        child: VerticalDivider(),
                      ),
                      RateReviewCard(
                          label: 'Reviews',
                          icon: AppIcons.chat,
                          count: '4,942'),
                    ],
                  ),
                  GlobalVariabels.vertical15,
                  const Divider(),
                  GlobalVariabels.vertical15,
                  const Text(
                    'Reviews',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
            PrimaryButton(onTap: () {
              Navigator.pushNamed(context,RouteConstants.dateSelectScreen);
            }, label: 'Book Appointment')
          ],
        ),
      ),
    );
  }
}
