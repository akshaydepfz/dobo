import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClinicViewScreen extends StatelessWidget {
  const ClinicViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                                  AppAssets.health,
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
                                title: 'Malappuram, kerala, india',
                                icon: AppIcons.location),
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
                      'About Clinic',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 60,
                      child: Text(
                        'The family care is oneof the topmost healthcare  providers , India. Our hospital’s are renowned for  their medical infrastructure and',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.grey4,
                        ),
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    const Divider(),
                    GlobalVariabels.vertical15,
                    const Text(
                      'Our Doctors',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    GlobalVariabels.vertical15,
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context,RouteConstants.doctorViewScreen);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 100,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset(
                                        AppAssets.doctor,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  GlobalVariabels.horizontal10,
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Dr. Rubayet Sakib',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Text(
                                          'Dental Specialist',
                                          style:
                                              TextStyle(color: AppColor.primary),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              width: width / 1.8,
                                              child: const Divider()),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child:
                                                  SvgPicture.asset(AppIcons.star),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              '4.6  (3,362 reviews)',
                                              style: TextStyle(
                                                  color: AppColor.grey3),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RateReviewCard extends StatelessWidget {
  const RateReviewCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.count,
  }) : super(key: key);
  final String label;
  final String icon;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary.withOpacity(0.2),
          ),
          padding: const EdgeInsets.all(15),
          height: 60,
          width: 60,
          child: SvgPicture.asset(icon),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: const TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColor.grey3),
        ),
      ],
    );
  }
}

class IconTile extends StatelessWidget {
  const IconTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 20, width: 20, child: SvgPicture.asset(icon)),
        GlobalVariabels.horizontal10,
        Text(title),
      ],
    );
  }
}
