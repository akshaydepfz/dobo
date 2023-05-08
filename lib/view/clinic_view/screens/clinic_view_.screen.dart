import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/assets/app_lottie.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/clinic_view/services/clinic_view_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ClinicViewScreen extends StatefulWidget {
  const ClinicViewScreen({super.key, required this.clinicId});
  final String clinicId;
  @override
  State<ClinicViewScreen> createState() => _ClinicViewScreenState();
}

class _ClinicViewScreenState extends State<ClinicViewScreen> {
  @override
  void initState() {
    Provider.of<ClinicDetailsService>(context, listen: false)
        .getClinicDetails(widget.clinicId);
    Provider.of<ClinicDetailsService>(context, listen: false)
        .getDoctorList(widget.clinicId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClinicDetailsService>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: provider.clinicDetail == null
          ? AppBar(
              foregroundColor: AppColor.primary,
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: provider.clinicDetail == null
          ? Center(
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
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    PrimaryAppbar(
                        title: provider.clinicDetail != null
                            ? provider.clinicDetail!.clinicName
                            : ''),
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
                                      border:
                                          Border.all(color: AppColor.grey2)),
                                  height: 100,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                  )),
                              GlobalVariabels.horizontal10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconTile(
                                      title: provider.clinicDetail!.clinicName,
                                      icon: AppIcons.hospital),
                                  GlobalVariabels.vertical10,
                                  IconTile(
                                      title:
                                          provider.clinicDetail!.ownerAddress,
                                      icon: AppIcons.location),
                                  GlobalVariabels.vertical10,
                                  const IconTile(
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
                            children: [
                              RateReviewCard(
                                label: 'Patients',
                                icon: AppIcons.group,
                                count: provider.clinicDetail!.patientsServed,
                              ),
                              const SizedBox(
                                height: 60,
                                child: VerticalDivider(),
                              ),
                              RateReviewCard(
                                label: 'Rating',
                                icon: AppIcons.star,
                                count:
                                    provider.clinicDetail!.avgRating.toString(),
                              ),
                              const SizedBox(
                                height: 60,
                                child: VerticalDivider(),
                              ),
                              const RateReviewCard(
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            child: Text(
                              provider.clinicDetail!.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColor.grey4,
                              ),
                            ),
                          ),
                          GlobalVariabels.vertical15,
                          const Divider(),
                          GlobalVariabels.vertical15,
                          const Text(
                            'Our Doctors',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          GlobalVariabels.vertical15,
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.doctorList == null
                                  ? 3
                                  : provider.doctorList!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                if (provider.doctorList == null) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Shimmer.fromColors(
                                        baseColor:
                                            AppColor.primary.withOpacity(0.1),
                                        highlightColor:
                                            AppColor.primary2.withOpacity(0.2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          height: 100,
                                          width: width,
                                        )),
                                  );
                                }
                                return DoctorCard(
                                    width: width,
                                    image: 'image',
                                    name: provider.doctorList![i].fullName,
                                    department: provider
                                        .doctorList![i].department.category,
                                    ratingCount: 'ratingCount',
                                    reviews: 'reviews');
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

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.width,
    required this.image,
    required this.name,
    required this.department,
    required this.ratingCount,
    required this.reviews,
  });
  final String image;
  final String name;
  final String department;
  final String ratingCount;
  final String reviews;

  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.doctorViewScreen);
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
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. $name",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    department,
                    style: const TextStyle(color: AppColor.primary),
                  ),
                  Expanded(
                    child: SizedBox(width: width / 1.8, child: const Divider()),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(AppIcons.star),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '4.6  (3,362 reviews)',
                        style: TextStyle(color: AppColor.grey3),
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
