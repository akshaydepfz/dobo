import 'package:dobo/common/common_loading.dart';
import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CategoryViewScreen extends StatefulWidget {
  const CategoryViewScreen({super.key, required this.departmentId});
  final String departmentId;

  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getDoctorList(widget.departmentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: provider.doctors == null
            ? const CommonLoadingWidget()
            : Column(
                children: [
                  const PrimaryAppbar(title: 'General Physician'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.doctors!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.doctorViewScreen);
                          },
                          child: DoctorCard(
                              width: width,
                              image: '',
                              name: provider.doctors![i].fullName,
                              department:
                                  provider.doctors![i].department.category,
                              rating: '4.6'),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.width,
    required this.image,
    required this.name,
    required this.department,
    required this.rating,
  });

  final double width;
  final String image;
  final String name;
  final String department;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: GlobalVariabels.shadow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                AppAssets.doctor2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GlobalVariabels.horizontal10,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Rubayet Sakib',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Dental Specialist',
                  style: TextStyle(color: AppColor.primary),
                ),
                Expanded(
                  child: SizedBox(width: width / 1.8, child: const Divider()),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(AppIcons.star),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '4.6  (3,362 reviews)',
                      style: TextStyle(color: AppColor.grey3),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
