// ignore_for_file: must_be_immutable

import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/screens/category_screens.dart';
import 'package:dobo/view/favorite/screens/favorite_screen.dart';
import 'package:dobo/view/home/screens/home_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/landing_page/widgets/bttom_nav_bar.dart';
import 'package:dobo/view/my_appointments/screens/my_appointments_screen.dart';
import 'package:dobo/view/profile/screens/profile_screen.dart';
import 'package:dobo/view/search/screens/search_screen.dart';
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
      'icon': AppIcons.addAppointment,
    },
    {
      'title': 'favorites',
      'icon': AppIcons.favorite,
    },
    {
      'title': 'History',
      'icon': AppIcons.history,
    },
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const MyAppointmentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavService>(context);
    return Scaffold(
      body: pages[bottomNavProvider.selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColor.grey2,
            )),
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
