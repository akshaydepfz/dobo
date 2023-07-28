import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.width,
    required this.image,
    required this.name,
    required this.department,
    required this.ratingCount,
    required this.reviews,
    required this.onTap,
  });
  final String image;
  final String name;
  final String department;
  final String ratingCount;
  final String reviews;
  final Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
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
                width: 100,
                height: 100,
                child: image == ''
                    ? Image.asset(AppAssets.avatar)
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
                    "Dr. $name",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    department,
                    style: const TextStyle(color: AppColor.primary),
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
      ),
    );
  }
}
