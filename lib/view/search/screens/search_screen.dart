import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/search/screens/search_category_screen.dart';
import 'package:dobo/view/search/screens/search_clinic_screen.dart';
import 'package:dobo/view/search/screens/search_doctors_screen.dart';
import 'package:dobo/view/search/services/search_service.dart';
import 'package:dobo/view/search/services/tab_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getDepartments();
    super.initState();
  }

  List<Widget> pages = [
    const SearchCategoryScreen(),
    const SearchDoctorsScreen(),
    const SearchClinicList(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchService>(context);
    final tabBarIndex = Provider.of<SearchTabBarService>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Search Doctors and clinics"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => tabBarIndex.onIndexChange(0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: tabBarIndex.pageIndex == 0
                                    ? AppColor.primary
                                    : AppColor.grey2)),
                        child: Center(
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 15,
                                color: tabBarIndex.pageIndex == 0
                                    ? AppColor.primary
                                    : AppColor.grey2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlobalVariabels.horizontal10,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => tabBarIndex.onIndexChange(1),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: tabBarIndex.pageIndex == 1
                                    ? AppColor.primary
                                    : AppColor.grey2)),
                        child: Center(
                          child: Text(
                            'Doctor',
                            style: TextStyle(
                                fontSize: 15,
                                color: tabBarIndex.pageIndex == 1
                                    ? AppColor.primary
                                    : AppColor.grey2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlobalVariabels.horizontal10,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => tabBarIndex.onIndexChange(2),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: tabBarIndex.pageIndex == 2
                                    ? AppColor.primary
                                    : AppColor.grey2)),
                        child: Center(
                          child: GestureDetector(
                            onTap: () => tabBarIndex.onIndexChange(2),
                            child: Text(
                              'Clinic',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: tabBarIndex.pageIndex == 2
                                      ? AppColor.primary
                                      : AppColor.grey2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GlobalVariabels.vertical15,
              Expanded(child: pages[tabBarIndex.pageIndex]),
            ],
          ),
        ),
      ),
    );
  }
}
