import 'package:dobo/common/common_loading.dart';
import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/clinic_view/services/clinic_view_service.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/doctor_card.dart';

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
      appBar: provider.clinicDetail != null
          ? AppBar(
              foregroundColor: AppColor.primary,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(provider.clinicDetail != null
                  ? provider.clinicDetail!.clinicName
                  : ''),
            )
          : null,
      body: provider.clinicDetail == null
          ? const CommonLoadingWidget()
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: AppColor.grey2)),
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: provider.clinicDetail!.image == ""
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(AppAssets.avatar),
                                        )
                                      : Image.network(
                                          provider.clinicDetail!.image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
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
                                  count: '0'),
                            ],
                          ),
                          const Divider(),
                          GlobalVariabels.vertical15,
                          Visibility(
                            visible: provider.clinicDetail!.description == null,
                            child: Column(
                              children: [
                                const Text(
                                  'About Clinic',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
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
                              ],
                            ),
                          ),
                          const Text(
                            'Our Doctors',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          GlobalVariabels.vertical10,
                          provider.doctorList == null
                              ? const LinearProgressIndicator()
                              : provider.doctorList!.isEmpty
                                  ? const Center(
                                      child: Text("No Doctors Found!"),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: provider.doctorList!.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return provider.doctorList!.isEmpty
                                            ? const Center(
                                                child:
                                                    Text('No Doctors Found!'),
                                              )
                                            : DoctorCard(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorViewScreen(
                                                        doctorId: provider
                                                            .doctorList![i].id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                width: width,
                                                image: provider
                                                    .doctorList![i].image,
                                                name: provider
                                                    .doctorList![i].fullName,
                                                department: provider
                                                    .doctorList![i]
                                                    .department
                                                    .category,
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
          height: 50,
          width: 50,
          child: SvgPicture.asset(icon),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: const TextStyle(
              color: AppColor.primary,
              fontSize: 15,
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
        SizedBox(height: 15, width: 15, child: SvgPicture.asset(icon)),
        GlobalVariabels.horizontal10,
        SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
            )),
      ],
    );
  }
}
