import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:dobo/view/search/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchClinicList extends StatefulWidget {
  const SearchClinicList({super.key});

  @override
  State<SearchClinicList> createState() => _SearchClinicListState();
}

class _SearchClinicListState extends State<SearchClinicList> {
  @override
  void initState() {
    Provider.of<SearchService>(context, listen: false).getClinicList('');
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchService>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                GlobalVariabels.horizontal10,
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppIcons.search),
                ),
                GlobalVariabels.horizontal10,
                Expanded(
                  child: TextField(
                    onChanged: (v) => provider.onClinicQuaryChanged(v),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: AppColor.grey3),
                        border: InputBorder.none,
                        hintText: "Search"),
                  ),
                ),
              ],
            ),
          ),
          GlobalVariabels.vertical15,
          provider.clinicList == null
              ? const Center(
                  child: CommonLoadingWidget(),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: provider.clinicList!.length,
                      itemBuilder: (context, i) {
                        return ClinicsCard(
                          isFavoriteLoad: provider.favorieIndex == i
                              ? provider.isFavorite
                              : false,
                          isFavorite: provider.clinicList![i].isFavorite,
                          onFavoriteClick: () => provider.addClinicFavorite(
                              context,
                              provider.clinicList![i].id,
                              provider.clinicList![i].isFavorite,
                              controller.text,
                              i),
                          width: MediaQuery.of(context).size.width,
                          avarageRating:
                              provider.clinicList![i].avgRating.toString(),
                          ratingCount: 2.toString(),
                          name: provider.clinicList![i].clinicName,
                          phone: provider.clinicList![i].phone,
                          image: provider.clinicList![i].image ?? "",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClinicViewScreen(
                                          clinicId: provider.clinicList![i].id,
                                        )));
                          },
                          address: provider.clinicList![i].city,
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
