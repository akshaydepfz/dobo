import 'package:dobo/constants/global_variables.dart';
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
    required this.onFavoriteClick,
    required this.isFavorite,
    required this.isFavoriteLoad,
  });
  final String image;
  final String name;
  final String department;
  final String ratingCount;
  final String reviews;
  final Function() onTap;
  final double width;
  final Function() onFavoriteClick;
  final bool isFavorite;
  final bool isFavoriteLoad;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 90,
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
                        ? Image.asset(AppIcons.doctorAvatar)
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
                      SizedBox(
                        width: width * .40,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        department,
                        style: const TextStyle(
                            color: AppColor.primary, fontSize: 13),
                      ),
                      Expanded(
                        child: SizedBox(
                            width: width / 1.8, child: const Divider()),
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
                            style:
                                TextStyle(color: AppColor.grey3, fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 20,
          child: GestureDetector(
            onTap: onFavoriteClick,
            child: SizedBox(
              height: 20,
              child: isFavoriteLoad
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ))
                  : isFavorite
                      ? SvgPicture.asset(
                          AppIcons.favorite,
                          color: AppColor.primary,
                        )
                      : Image.asset(
                          AppIcons.favOutline,
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
