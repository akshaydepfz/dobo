import 'package:dobo/common/common_loading.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getDepartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: categoryProvider.departments == null
                ? const Center(child: CommonLoadingWidget())
                : GridView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: categoryProvider.departments!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryViewScreen(
                                      department:
                                          categoryProvider.departments![i].name,
                                      departmentId: categoryProvider
                                          .departments![i].id)));
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
                                  height: 80,
                                  width: 80,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFEEFCFA),
                                  ),
                                  child: Center(
                                      child: Image.network(categoryProvider
                                          .departments![i].image)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  categoryProvider.departments![i].name,
                                  textAlign: TextAlign.center,
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
