import 'package:carousel_slider/carousel_slider.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/home/screens/all_clinics_screen.dart';
import 'package:dobo/view/home/screens/all_doctors_screen.dart';
import 'package:dobo/view/home/services/home_provider.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:dobo/view/home/widgets/reminder_card.dart';
import 'package:dobo/view/home/widgets/slider_card.dart';
import 'package:dobo/view/home/widgets/title_card.dart';
import 'package:dobo/view/profile/services/profile_services.dart';
import 'package:dobo/view/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProfileService>(context, listen: false).getProfileDetails();
    Provider.of<HomeProvider>(context, listen: false).getLocation();
    Provider.of<HomeProvider>(context, listen: false).getNearestClinics();
    Provider.of<HomeProvider>(context, listen: false).getReminders();
    Provider.of<HomeProvider>(context, listen: false).getSliders();
    Provider.of<HomeProvider>(context, listen: false).getDoctorList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final profileProvider = Provider.of<ProfileService>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.profileScreen);
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: profileProvider.userModel == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset(AppAssets.avatar))
                                : Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle),
                                    child: profileProvider.userModel!.image ==
                                            ''
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child:
                                                Image.asset(AppAssets.avatar))
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.network(
                                              profileProvider.userModel!.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: width * .28,
                          child: Text(
                            provider.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Change Your Location Now!',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            GlobalVariabels.vertical10,
                                            const Divider(),
                                            GlobalVariabels.vertical10,
                                            PrimaryButton(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      RouteConstants
                                                          .locationSelect);
                                                },
                                                label: 'Change Location'),
                                            SecondaryButton(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                label: 'Cancel')
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: const Icon(
                            Icons.expand_more_outlined,
                            size: 30,
                            color: AppColor.grey3,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.notificationScreen);
                      },
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppIcons.bell),
                      ),
                    ),
                  ],
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.grey1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(AppIcons.search),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Search',
                          style: TextStyle(fontSize: 16, color: AppColor.grey2),
                        )
                      ],
                    ),
                  ),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                provider.sliders.isEmpty
                    ? SizedBox(
                        width: width,
                        height: 160.0,
                        child: Shimmer.fromColors(
                            baseColor: AppColor.primary.withOpacity(0.1),
                            highlightColor: AppColor.primary2.withOpacity(0.2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 160,
                              width: width,
                            )))
                    : CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 160,
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            initialPage: 0,
                            viewportFraction: 1.0),
                        itemCount: provider.sliders.length,
                        itemBuilder: (context, i, intex) {
                          return SliderCard(
                            width: width,
                            title: provider.sliders[i].title,
                            image: provider.sliders[i].description,
                          );
                        }),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: provider.reminders.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today Bookings',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider.builder(
                          itemCount: provider.reminders.length,
                          itemBuilder: (context, i, intex) {
                            return ReminderCard(
                              width: width,
                              doctor: provider.reminders[i].title,
                              dateTime: provider.reminders[i].time,
                              token: provider.reminders[i].token,
                              clinic: provider.reminders[i].clinic,
                              department: provider.reminders[i].department,
                            );
                          },
                          options: CarouselOptions(
                              height: 100,
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              initialPage: 0,
                              viewportFraction: 1.0)),
                    ],
                  ),
                ),
                TitleCard(
                    title: 'Popular Clinics',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllClinicsScreen()))),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.clinicList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return ClinicsCard(
                      isFavoriteLoad: provider.favorieIndex == i
                          ? provider.isFavoriteLoad
                          : false,
                      isFavorite: provider.clinicList[i].isFavorite,
                      onFavoriteClick: () => provider.addClinicFavorite(
                        context,
                        provider.clinicList[i].id,
                        provider.clinicList[i].isFavorite,
                        i,
                      ),
                      width: width,
                      avarageRating:
                          provider.clinicList[i].avgRating.toString(),
                      ratingCount: 2.toString(),
                      name: provider.clinicList[i].clinicName,
                      category: provider.clinicList[i].subtext,
                      image: provider.clinicList[i].image ??
                          "https://t4.ftcdn.net/jpg/03/47/41/03/360_F_347410397_5PpZbcQpnEqqzlGjOk1R5d11977LbMUW.jpg",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClinicViewScreen(
                                      clinicId: provider.clinicList[i].id,
                                    )));
                      },
                    );
                  },
                ),
                // TitleCard(
                //     title: 'Doctors',
                //     onTap: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const AllDoctorsScreen()))),
                // SizedBox(
                //   height: 170,
                //   child: provider.doctorList == null
                //       ? const SizedBox(child: SizedBox())
                //       : ListView.builder(
                //           itemCount: provider.doctorList!.length,
                //           shrinkWrap: true,
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (context, i) {
                //             return GestureDetector(
                //               onTap: () {
                //                 Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => DoctorViewScreen(
                //                         doctorId: provider.doctorList![i].id),
                //                   ),
                //                 );
                //                 // Navigator.pushNamed(
                //                 //     context, RouteConstants.doctorViewScreen);
                //               },
                //               child: Container(
                //                 margin: const EdgeInsets.all(10),
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(8.0),
                //                 ),
                //                 width: 157,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(
                //                       height: 100,
                //                       width: width,
                //                       child: provider.doctorList![i].image ==
                //                               null
                //                           ? Container(
                //                               padding: const EdgeInsets.all(10),
                //                               decoration: BoxDecoration(
                //                                   color: Colors.grey.shade200,
                //                                   borderRadius:
                //                                       const BorderRadius.only(
                //                                     topLeft:
                //                                         Radius.circular(5.0),
                //                                     topRight:
                //                                         Radius.circular(5.0),
                //                                   )),
                //                               child:
                //                                   Image.asset(AppAssets.avatar),
                //                             )
                //                           : Image.network(
                //                               provider.doctorList![i].image,
                //                               fit: BoxFit.cover,
                //                             ),
                //                     ),
                //                     const SizedBox(
                //                       height: 5,
                //                     ),
                //                     Text(
                //                       provider.doctorList![i].fullName,
                //                       style: const TextStyle(),
                //                     ),
                //                     Text(
                //                       provider.doctorList![i].designation,
                //                       textAlign: TextAlign.center,
                //                       maxLines: 1,
                //                       style: const TextStyle(
                //                           color: AppColor.primary),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             );
                //           }),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
