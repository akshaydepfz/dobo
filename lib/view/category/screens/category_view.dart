import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class CategoryViewScreen extends StatelessWidget {
  const CategoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'General Physician'),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: GlobalVariabels.shadow,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 120,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              AppAssets.doctor2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GlobalVariabels.horizontal10,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dr. Rubayet Sakib',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                'Dental Specialist',
                                style: TextStyle(color: AppColor.primary),
                              ),
                              Expanded(
                                child: SizedBox(
                                    width: width / 1.8, child: const Divider()),
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
                                  const Text(
                                    '4.6  (3,362 reviews)',
                                    style: TextStyle(color: AppColor.grey3),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
