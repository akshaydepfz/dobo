import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CategoryViewScreen extends StatefulWidget {
  const CategoryViewScreen(
      {super.key, required this.departmentId, required this.department});
  final String departmentId;
  final String department;

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
      appBar: AppBar(
        title: Text(
          "${widget.department} Doctors",
          style: const TextStyle(fontSize: 15),
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: provider.doctors == null
            ? const CommonLoadingWidget()
            : provider.doctors!.isEmpty
                ? const Center(
                    child: Text('No Doctors Found!'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.doctors!.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorViewScreen(
                                        clinicId: '',
                                        clinicName:
                                            provider.doctors![i].fullName,
                                        insideClinic: false,
                                        doctorId: provider.doctors![i].id,
                                      )));
                        },
                        child: DoctorCard(
                            width: width,
                            image: provider.doctors![i].image ?? "",
                            name: provider.doctors![i].fullName,
                            department:
                                provider.doctors![i].department.category,
                            rating: '4.6'),
                      );
                    },
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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: GlobalVariabels.shadow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: SizedBox(
              width: 90,
              height: 100,
              child: image == ""
                  ? Image.asset(
                      AppIcons.doctorAvatar,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      image,
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
                Text(
                  'Dr. $name',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  department,
                  style: const TextStyle(color: AppColor.primary, fontSize: 13),
                ),
                Expanded(
                  child: SizedBox(width: width / 1.8, child: const Divider()),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
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
