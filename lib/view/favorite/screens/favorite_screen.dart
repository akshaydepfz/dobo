import 'package:dobo/common/common_loading.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                provider.clinicList == null
                    ? Padding(
                        padding: EdgeInsets.only(top: height * .30),
                        child: const CommonLoadingWidget())
                    : provider.clinicList!.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: height * .30),
                            child: const Text('No Favorite Clinics!'),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.clinicList!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return ClinicsCard(
                                isFavorite: provider.clinicList![i].isFavorite,
                                onFavoriteClick: () =>
                                    provider.addClinicFavorite(
                                  context,
                                  provider.clinicList![i].id,
                                  provider.clinicList![i].isFavorite,
                                ),
                                width: width,
                                avarageRating: provider.clinicList![i].avgRating
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
                                                clinicId:
                                                    provider.clinicList![i].id,
                                              )));
                                  // Navigator.push(context,MaterialPageRoute(builder:(context) =>ClinicViewScreen()));
                                },
                              );
                            })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
