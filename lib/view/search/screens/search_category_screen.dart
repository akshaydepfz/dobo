import 'package:dobo/common/common_loading.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getDepartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                GlobalVariabels.horizontal10,
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppIcons.search),
                ),
                GlobalVariabels.horizontal10,
                Expanded(
                  child: TextField(
                    onChanged: (v) => categoryProvider.onQuaryChanged(v),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: AppColor.grey3),
                        border: InputBorder.none,
                        hintText: "Search"),
                  ),
                ),
              ],
            ),
          ),
          GlobalVariabels.vertical10,
          Expanded(
            child: categoryProvider.departments == null
                ? const Center(child: CommonLoadingWidget())
                : GridView.builder(
                    //         padding: const EdgeInsets.all(10),
                    itemCount: categoryProvider.quary == ""
                        ? categoryProvider.departments!.length
                        : categoryProvider.quaryDepartments.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryViewScreen(
                                      department: categoryProvider.quary == ""
                                          ? categoryProvider
                                              .departments![i].name
                                          : categoryProvider
                                              .quaryDepartments[i].name,
                                      departmentId: categoryProvider.quary == ""
                                          ? categoryProvider.departments![i].id
                                          : categoryProvider
                                              .quaryDepartments[i].id)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(4.0, 4.0),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFEEFCFA),
                                  ),
                                  child: Center(
                                      child: categoryProvider.quary == ""
                                          ? Image.network(categoryProvider
                                              .departments![i].image)
                                          : Image.network(categoryProvider
                                              .quaryDepartments[i].image)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    categoryProvider.quary == ""
                                        ? categoryProvider.departments![i].name
                                        : categoryProvider
                                            .quaryDepartments[i].name,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
