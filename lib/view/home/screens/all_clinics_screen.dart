import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/home/services/view_all_services.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllClinicsScreen extends StatefulWidget {
  const AllClinicsScreen({super.key});

  @override
  State<AllClinicsScreen> createState() => _AllClinicsScreenState();
}

class _AllClinicsScreenState extends State<AllClinicsScreen> {
  @override
  void initState() {
    Provider.of<ViewAllService>(context, listen: false).getClinicList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewAllService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Clinics"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColor.grey3),
                            border: InputBorder.none,
                            hintText: "Search clinic"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppIcons.search),
                      ),
                    ),
                  ],
                ),
              ),
              GlobalVariabels.vertical10,
              if (provider.clinicList == null)
                const Center(
                  child: CommonLoadingWidget(),
                )
              else
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.clinicList!.length,
                      itemBuilder: (context, i) {
                        return ClinicsCard(
                          isFavorite: provider.clinicList![i].isFavorite,
                          onFavoriteClick: () => provider.addClinicFavorite(
                            context,
                            provider.clinicList![i].id,
                            provider.clinicList![i].isFavorite,
                          ),
                          width: MediaQuery.of(context).size.width,
                          avarageRating:
                              provider.clinicList![i].avgRating.toString(),
                          ratingCount: 2.toString(),
                          name: provider.clinicList![i].clinicName,
                          category: provider.clinicList![i].subtext,
                          image: provider.clinicList![i].image ??
                              "https://t4.ftcdn.net/jpg/03/47/41/03/360_F_347410397_5PpZbcQpnEqqzlGjOk1R5d11977LbMUW.jpg",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClinicViewScreen(
                                          clinicId: provider.clinicList![i].id,
                                        )));
                          },
                        );
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
