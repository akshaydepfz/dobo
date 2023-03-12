import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/view/home/widgets/clinics_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/clinc_list_controller/clinicList.dart';
import '../../../model/models/clincList.dart';
import '../../../repository/clincList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final auth = Provider.of<clincService>(context, listen: false);
    // });
    var controller = Provider.of<clincService>(context, listen: false);
    controller.doctorlist;

    super.initState();
  }

  // late List<ClinicList> dl = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                GlobalVariabels.vertical10,
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.grey1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dr. Rubayet Sakib",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.grey4,
                            fontWeight: FontWeight.w500),
                      ),
                      GlobalVariabels.vertical10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.timer,
                                color: AppColor.grey3,
                              ),
                              GlobalVariabels.horizontal10,
                              Text(
                                "Today 8:30 pm",
                                style: TextStyle(color: AppColor.grey3),
                              )
                            ],
                          ),
                          const Text(
                            "16/20",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.grey4),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                TitleCard(title: 'Popular Clinics', onTap: () {}),
                Consumer<clincService>(builder: (context, data, _) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.doctorlist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return ClinicsCard(
                        width: width,
                        name: data.doctorlist[i].clinicName,
                        category: data.doctorlist[i].city,
                        image: AppAssets.health,
                        onTap: () {
                          Navigator.pushNamed(context, '/clinicview');
                        },
                      );
                    },
                  );
                }),
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
