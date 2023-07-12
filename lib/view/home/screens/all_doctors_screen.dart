import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/home/services/view_all_services.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({super.key});

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  @override
  void initState() {
    Provider.of<ViewAllService>(context, listen: false).getDoctorList();
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
        title: const Text("Doctors"),
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
                    Expanded(
                      child: TextField(
                        onChanged: (v) => provider.onDoctorQuaryChanged(v),
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: AppColor.grey3),
                            border: InputBorder.none,
                            hintText: "Search Doctors"),
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
              provider.doctorList == null
                  ? const Center(
                      child: CommonLoadingWidget(),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: provider.doctorList!.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorViewScreen(
                                              doctorId:
                                                  provider.doctorList![i].id,
                                            )));
                              },
                              child: DoctorCard(
                                  width: MediaQuery.of(context).size.width,
                                  image: provider.doctorList![i].image ?? "",
                                  name: provider.doctorList![i].fullName,
                                  department: provider
                                      .doctorList![i].department.category,
                                  rating: '4.6'),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
