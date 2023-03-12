import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/view/appointment/screens/review_summery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppointmentViewScreen extends StatelessWidget {
  const AppointmentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryAppbar(title: 'My Appointment'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColor.grey1,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: const [
                              Text(
                                "Token Number : ",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "58",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.grey4),
                              ),
                            ],
                          )),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Clinic',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      Row(
                        children: [
                          Container(
                            height: height * .11,
                            width: height * .11,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.health),
                                  fit: BoxFit.cover),
                              border: Border.all(color: AppColor.grey3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          GlobalVariabels.horizontal10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'The family care',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: '+91 2649351476', icon: AppIcons.call),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: 'Malappuram, kerala, india',
                                  icon: AppIcons.location),
                            ],
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      Row(
                        children: [
                          Container(
                            height: height * .11,
                            width: height * .11,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.doctor2),
                                  fit: BoxFit.cover),
                              border: Border.all(color: AppColor.grey3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          GlobalVariabels.horizontal10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Dr. Rubayet Sakib',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: 'The family care',
                                  icon: AppIcons.hospital),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                name: 'Dental Specialist',
                                icon: AppIcons.medal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date & Time',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GlobalVariabels.vertical10,
                              Row(
                                children: const [
                                  Text(
                                    'March 15, 2022',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    '09:00 AM',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 88,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "Upcoming",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Consultation Started",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 30,
                            width: 88,
                            decoration: BoxDecoration(
                                color: AppColor.grey1,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "02/58",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Booking ID    :',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '05842026',
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Patient Details',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      const TextTile(title: 'Name', value: 'Rubayet Sakib'),
                      const Divider(),
                      const TextTile(title: 'Gender', value: 'Male'),
                      const Divider(),
                      const TextTile(title: 'Age', value: '24'),
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Problem :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GlobalVariabels.vertical10,
                      const Text(
                        'The family care is oneof the to are pmost to health care providers , India. Our hos pital’s are renowned for to their medical infras the tructure...',
                        style: TextStyle(),
                      ),
                      GlobalVariabels.vertical10,
                      PrimaryButton(onTap: () {}, label: 'Reschedule'),
                      SecondaryButton(onTap: () {}, label: 'Cancel')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
