import 'package:dobo/common/common_loading.dart';
import 'package:dobo/core/style/app_colors.dart';

import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/favorite/services/favorite_service.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).getfavoriteClinics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                provider.clinicList == null
                    ? Padding(
                        padding: EdgeInsets.only(top: height * .30),
                        child: const CommonLoadingWidget())
                    : provider.clinicList!.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: height * .35),
                            child: const Text('No Favorite Clinics!'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: provider.clinicList!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return ClinicsCard(
                                    isFavoriteLoad: false,
                                    isFavorite:
                                        provider.clinicList![i].isFavorite,
                                    onFavoriteClick: () =>
                                        provider.addClinicFavorite(
                                      context,
                                      provider.clinicList![i].id,
                                      provider.clinicList![i].isFavorite,
                                    ),
                                    width: width,
                                    avarageRating: provider
                                        .clinicList![i].avgRating
                                        .toString(),
                                    ratingCount: 2.toString(),
                                    name: provider.clinicList![i].clinicName,
                                    phone: provider.clinicList![i].phone,
                                    image: provider.clinicList![i].image ?? "",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClinicViewScreen(
                                                    clinicId: provider
                                                        .clinicList![i].id,
                                                  )));
                                      // Navigator.push(context,MaterialPageRoute(builder:(context) =>ClinicViewScreen()));
                                    },
                                    address: provider.clinicList![i].address,
                                  );
                                }),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
