import 'package:carousel_slider/carousel_slider.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/home/screens/all_clinics_screen.dart';
import 'package:dobo/view/home/services/home_provider.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:dobo/view/home/widgets/reminder_card.dart';
import 'package:dobo/view/home/widgets/slider_card.dart';
import 'package:dobo/view/home/widgets/title_card.dart';
import 'package:dobo/view/profile/screens/profile_edit.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 50, left: 10, right: 10, bottom: 10),
              decoration: const BoxDecoration(
                color: AppColor.primary,
              ),
              child: Row(
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
                          height: 40,
                          width: 40,
                          child: profileProvider.userModel == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(AppAssets.avatar))
                              : Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle),
                                  child: profileProvider.userModel!.image == ''
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image.asset(AppAssets.avatar))
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProfileEditScreen()));
                                              },
                                              label: 'Edit Profile'),
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
                        child: SizedBox(
                          width: width * .28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              profileProvider.userModel == null
                                  ? SizedBox()
                                  : Text(
                                      profileProvider.userModel!.fullName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                            ],
                          ),
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProfileEditScreen()));
                                              },
                                              label: 'Edit Profile'),
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
                          size: 25,
                          color: Colors.white,
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
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        AppIcons.bell,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColor.grey2),
                        color: AppColor.grey1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppIcons.search),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Search Doctor / Clinic',
                            style:
                                TextStyle(fontSize: 15, color: AppColor.grey2),
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
                              highlightColor:
                                  AppColor.primary2.withOpacity(0.2),
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
                              height: 140,
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
                    padding: EdgeInsets.zero,
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
                        image: provider.clinicList[i].image ?? "",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
