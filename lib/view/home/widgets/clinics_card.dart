import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClinicsCard extends StatelessWidget {
  const ClinicsCard({
    Key? key,
    required this.width,
    required this.name,
    required this.category,
    required this.image,
    required this.onTap,
    required this.ratingCount,
    required this.avarageRating,
    required this.onFavoriteClick,
    required this.isFavorite,
    required this.isFavoriteLoad,
  }) : super(key: key);

  final double width;
  final String name;
  final String category;
  final String image;
  final String ratingCount;
  final String avarageRating;
  final Function() onFavoriteClick;
  final Function() onTap;
  final bool isFavorite;
  final bool isFavoriteLoad;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 120,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: SizedBox(
                    width: 90,
                    height: 90,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * .50,
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        color: AppColor.primary,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 10, width: width / 2, child: const Divider()),
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
                        Text(
                          '$avarageRating ($ratingCount reviews)',
                          style: const TextStyle(color: AppColor.grey3),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
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
          )
        ],
      ),
    );
  }
}
