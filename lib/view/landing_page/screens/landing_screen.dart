import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: PageView()),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomNavItem(
              icon: AppIcons.home,
              title: 'Home',
              isSelected: false,
            ),
            BottomNavItem(
              icon: AppIcons.category,
              title: 'Category',
              isSelected: false,
            ),
            BottomNavItem(
              icon: AppIcons.favorite,
              title: 'favorites',
              isSelected: true,
            ),
            BottomNavItem(
              icon: AppIcons.person,
              title: 'Profile',
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);
  final String icon;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
