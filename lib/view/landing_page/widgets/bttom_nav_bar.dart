import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: Image.asset(
              icon,
              color: isSelected ? AppColor.primary : AppColor.grey3,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: isSelected ? AppColor.primary : AppColor.grey3),
          ),
        ],
      ),
    );
  }
}
