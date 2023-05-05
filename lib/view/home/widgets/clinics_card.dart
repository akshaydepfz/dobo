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
  }) : super(key: key);

  final double width;
  final String name;
  final String category;
  final String image;
  final String ratingCount;
  final String avarageRating;

  final Function() onTap;

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
                SizedBox(
                  width: 100,
                  child: Image.network(image),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
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
          SizedBox(
            height: 20,
            child: Image.asset(AppIcons.favOutline),
          )
        ],
      ),
    );
  }
}
