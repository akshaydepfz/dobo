import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClinicSloteCard extends StatelessWidget {
  const ClinicSloteCard({
    super.key,
    required this.width,
    required this.image,
    required this.name,
    required this.slote,
    required this.isSelected,
    required this.location,
    required this.onTap,
  });

  final double width;
  final Function() onTap;
  final String image;
  final String name;
  final String slote;
  final bool isSelected;
  final String location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: AppColor.primary) : null,
          color: isSelected ? AppColor.primary.withOpacity(0.1) : Colors.white,
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
                child: image == ""
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.avatar,
                          fit: BoxFit.cover,
                        ),
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
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    slote,
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
                        child: SvgPicture.asset(AppIcons.location),
                      ),
                      SizedBox(
                        width: width / 1.9,
                        child: Text(
                          location,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
