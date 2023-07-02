import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';

import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:dobo/view/search/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../category/screens/category_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Search Doctors and clinics"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => provider.oncategoryChange(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: provider.searchDoctor
                                    ? AppColor.primary
                                    : AppColor.grey2)),
                        child: Center(
                          child: Text(
                            'Doctor',
                            style: TextStyle(
                                fontSize: 16,
                                color: provider.searchDoctor
                                    ? AppColor.primary
                                    : AppColor.grey2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlobalVariabels.horizontal10,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => provider.oncategoryChange(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: provider.searchDoctor
                                    ? AppColor.grey2
                                    : AppColor.primary)),
                        child: Center(
                          child: Text(
                            'Clinic',
                            style: TextStyle(
                                fontSize: 16,
                                color: provider.searchDoctor
                                    ? AppColor.grey2
                                    : AppColor.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GlobalVariabels.vertical15,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColor.grey3),
                            border: InputBorder.none,
                            hintText: provider.searchDoctor
                                ? 'Search doctor'
                                : "Search clinic"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => provider.searchDoctor
                          ? provider.getDoctorList(controller.text)
                          : provider.getClinicList(controller.text),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppIcons.search),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: (provider.clinicList == null &&
                          provider.doctorList == null)
                      ? const Center(
                          child: Text('Search Doctors and Clinics'),
                        )
                      : provider.searchDoctor
                          ? provider.doctorList == null
                              ? const Center(
                                  child: CommonLoadingWidget(),
                                )
                              : ListView.builder(
                                  itemCount: provider.doctorList!.length,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorViewScreen(
                                                      doctorId: provider
                                                          .doctorList![i].id,
                                                    )));
                                      },
                                      child: DoctorCard(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          image:
                                              provider.doctorList![i].image ??
                                                  "",
                                          name:
                                              provider.doctorList![i].fullName,
                                          department: provider.doctorList![i]
                                              .department.category,
                                          rating: '4.6'),
                                    );
                                  })
                          : provider.clinicList == null
                              ? const Center(
                                  child: CommonLoadingWidget(),
                                )
                              : ListView.builder(
                                  itemCount: provider.clinicList!.length,
                                  itemBuilder: (context, i) {
                                    return ClinicsCard(
                                      isFavorite:
                                          provider.clinicList![i].isFavorite,
                                      onFavoriteClick: () =>
                                          provider.addClinicFavorite(
                                              context,
                                              provider.clinicList![i].id,
                                              provider
                                                  .clinicList![i].isFavorite,
                                              controller.text),
                                      width: MediaQuery.of(context).size.width,
                                      avarageRating: provider
                                          .clinicList![i].avgRating
                                          .toString(),
                                      ratingCount: 2.toString(),
                                      name: provider.clinicList![i].clinicName,
                                      category: provider.clinicList![i].subtext,
                                      image: provider.clinicList![i].image ??
                                          "https://t4.ftcdn.net/jpg/03/47/41/03/360_F_347410397_5PpZbcQpnEqqzlGjOk1R5d11977LbMUW.jpg",
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClinicViewScreen(
                                                      clinicId: provider
                                                          .clinicList![i].id,
                                                    )));
                                      },
                                    );
                                  }))
            ],
          ),
        ),
      ),
    );
  }
}
