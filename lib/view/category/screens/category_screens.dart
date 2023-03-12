import 'package:dobo/view/category/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: SafeArea(
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
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: categoryProvider.categoryItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10),
                itemBuilder: (context, i) {
                  return Container(
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
                                child: Image.asset(
                                    categoryProvider.categoryItems[i].icon)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            categoryProvider.categoryItems[i].title,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
