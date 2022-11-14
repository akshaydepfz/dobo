import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.avatar),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Malappuram...',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.expand_more_outlined,
                        size: 30,
                        color: AppColor.grey3,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppIcons.bell),
                  ),
                ],
              ),
              GlobalVariabels.vertical10,
              GlobalVariabels.vertical10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(AppIcons.search),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColor.grey3),
                            border: InputBorder.none,
                            hintText: 'Search'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF00776D),
                      Color(0xFF00DCC9),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
