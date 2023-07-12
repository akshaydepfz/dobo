import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class CancelldCard extends StatelessWidget {
  const CancelldCard({
    Key? key,
    required this.clinicName,
    required this.doctorName,
    required this.time,
    required this.clinicImage,
    required this.weekday,
  }) : super(key: key);
  final String clinicName;
  final String doctorName;
  final String time;
  final String clinicImage;
  final String weekday;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: GlobalVariabels.shadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 100,
                    child: clinicImage == ''
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppAssets.avatar),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(clinicImage),
                          )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clinicName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dr. $doctorName',
                      style: const TextStyle(color: AppColor.grey4),
                    ),
                    GlobalVariabels.vertical10,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Cancelled',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        GlobalVariabels.horizontal10,
                        Text(
                          weekday,
                          style: const TextStyle(
                              fontSize: 14, color: AppColor.grey4),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 14, color: AppColor.grey4),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
