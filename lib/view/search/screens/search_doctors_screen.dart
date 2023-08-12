import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';

import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/search/services/search_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../category/screens/category_view.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State<SearchDoctorsScreen> createState() => _SearchDoctorsScreenState();
}

class _SearchDoctorsScreenState extends State<SearchDoctorsScreen> {
  @override
  void initState() {
    Provider.of<SearchService>(context, listen: false).getDoctorList('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchService>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            //margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    onChanged: (v) => provider.onDoctorQuaryChanged(v),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: AppColor.grey3),
                        border: InputBorder.none,
                        hintText: "Search"),
                  ),
                ),
              ],
            ),
          ),
          provider.doctorList == null
              ? const Center(
                  child: CommonLoadingWidget(),
                )
              : Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: provider.doctorList!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorViewScreen(
                                          doctorId: provider.doctorList![i].id,
                                        )));
                          },
                          child: DoctorCard(
                              width: MediaQuery.of(context).size.width,
                              image: provider.doctorList![i].image ?? "",
                              name: provider.doctorList![i].fullName,
                              department:
                                  provider.doctorList![i].department.name,
                              rating: '4.6'),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
