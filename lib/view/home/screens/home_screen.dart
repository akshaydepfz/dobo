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
        child: SingleChildScrollView(
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
                      ),
                    ],
                  ),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 160,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Medical Checks!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Text(
                        'Chck your health condition regularly to minimize the incidence of disease in future.',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                TitleCard(title: 'Popular Clinics', onTap: () {}),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: 120,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Image.asset(AppAssets.health),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'The Family Care',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Health care clinic',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        height: 10,
                                        width: width / 2,
                                        child: const Divider()),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(AppIcons.star),
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
                            ],
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(AppIcons.favOutline),
                          )
                        ],
                      ),
                    );
                  },
                ),
                TitleCard(title: 'Specialist Doctors', onTap: () {}),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 157,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: width,
                                child: Image.asset(
                                  AppAssets.doctor,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Dr. Rubayet Sakib',
                                style: TextStyle(),
                              ),
                              const Text(
                                'Dental Specialist',
                                style: TextStyle(color: AppColor.primary),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'See All',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
