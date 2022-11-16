// ignore_for_file: must_be_immutable

import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/view/category/screens/category_screens.dart';
import 'package:dobo/view/home/screens/home_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/landing_page/widgets/bttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  List<Map> tabBarItems = [
    {
      'title': 'Home',
      'icon': AppIcons.home,
    },
    {
      'title': 'Category',
      'icon': AppIcons.category,
    },
    {
      'title': 'Booking',
      'icon': AppIcons.calendar,
    },
    {
      'title': 'favorites',
      'icon': AppIcons.favorite,
    },
    {
      'title': 'Profile',
      'icon': AppIcons.person,
    },
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const HomeScreen(),
    const CategoryScreen(),
    const CategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavService>(context);
    return Scaffold(
      body: pages[bottomNavProvider.selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            tabBarItems.length,
            (i) => BottomNavItem(
              icon: tabBarItems[i]['icon'],
              title: tabBarItems[i]['title'],
              isSelected: bottomNavProvider.selectedIndex == i,
              onTap: () {
                bottomNavProvider.onTabClicked(i);
              },
            ),
          ),
        ),
      ),
    );
  }
}
