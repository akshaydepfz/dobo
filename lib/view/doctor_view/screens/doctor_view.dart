import 'package:dobo/common/common_loading.dart';
import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/appointment/screens/date_slot_select.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/doctor_view/services/doctor_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DoctorViewScreen extends StatefulWidget {
  const DoctorViewScreen({super.key, required this.doctorId});
  final String doctorId;

  @override
  State<DoctorViewScreen> createState() => _DoctorViewScreenState();
}

class _DoctorViewScreenState extends State<DoctorViewScreen> {
  @override
  void initState() {
    Provider.of<DoctorDetailService>(context, listen: false)
        .getDoctorDetails(widget.doctorId);
    Provider.of<DoctorDetailService>(context, listen: false)
        .getDoctorReview(widget.doctorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DoctorDetailService>(context);
    return Scaffold(
      body: provider.doctorDetail == null
          ? const CommonLoadingWidget()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PrimaryAppbar(title: provider.doctorDetail!.fullName),
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
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(color: AppColor.grey2)),
                                  height: 100,
                                  child: provider.doctorDetail!.image == null
                                      ? Image.asset(AppAssets.avatar)
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            provider.doctorDetail!.image,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                              GlobalVariabels.horizontal10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const IconTile(
                                      title: 'Health care clinic',
                                      icon: AppIcons.hospital),
                                  GlobalVariabels.vertical10,
                                  IconTile(
                                      title: provider
                                          .doctorDetail!.department.category,
                                      icon: AppIcons.medal),
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
                                  count: provider.doctorDetail!.patientsServed),
                              const SizedBox(
                                height: 60,
                                child: VerticalDivider(),
                              ),
                              RateReviewCard(
                                  label: 'Rating',
                                  icon: AppIcons.star,
                                  count: provider.doctorDetail!.avgRating),
                              const SizedBox(
                                height: 60,
                                child: VerticalDivider(),
                              ),
                              RateReviewCard(
                                  label: 'Reviews',
                                  icon: AppIcons.chat,
                                  count: provider.doctorDetail!.reviewsCount),
                            ],
                          ),
                          GlobalVariabels.vertical15,
                          const Divider(),
                          GlobalVariabels.vertical15,
                          const Text(
                            'About',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          GlobalVariabels.vertical15,
                          Text(
                            provider.doctorDetail!.description,
                            style: const TextStyle(fontSize: 15),
                          ),
                          GlobalVariabels.vertical15,
                          const Text(
                            'Reviews',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          GlobalVariabels.vertical15,
                          provider.reviews == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : provider.reviews!.isEmpty
                                  ? const Center(
                                      child: Text('No Reviews Found!'),
                                    )
                                  : ListView.builder(
                                      itemCount: provider.reviews!.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return RatiingCard(
                                          image:
                                              provider.reviews![i].patientImage,
                                          rating: provider.reviews![i].rating,
                                          review: provider.reviews![i].review,
                                          name:
                                              provider.reviews![i].patientName,
                                        );
                                      })
                        ],
                      ),
                    ),
                    PrimaryButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DateSelectingScreen(
                                doctorId: provider.doctorDetail!.id,
                                isRechedule: false,
                              ),
                            ),
                          );
                        },
                        label: 'Book Appointment')
                  ],
                ),
              ),
            ),
    );
  }
}

class RatiingCard extends StatelessWidget {
  const RatiingCard({
    super.key,
    required this.image,
    required this.rating,
    required this.review,
    required this.name,
  });
  final String name;

  final String image;
  final int rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 25,
              child: image == ''
                  ? Image.asset(AppAssets.avatar)
                  : Image.network(image),
            ),
            title: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: RatingBarIndicator(
              rating: 3.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: AppColor.primary,
              ),
              itemCount: rating,
              itemSize: 15,
              direction: Axis.horizontal,
            ),
          ),
          Text(review,
              style: const TextStyle(
                  color: AppColor.grey4,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
