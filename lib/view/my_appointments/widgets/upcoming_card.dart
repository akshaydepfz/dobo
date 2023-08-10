import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/my_appointments/widgets/appointment_buttons.dart';
import 'package:flutter/material.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({
    Key? key,
    required this.clinicName,
    required this.doctorName,
    required this.time,
    required this.clinicImage,
    required this.weekday,
    required this.onCancellPressed,
    required this.onReschedulePressed,
    required this.onCardPressed,
  }) : super(key: key);
  final String clinicName;
  final String doctorName;
  final String time;
  final String clinicImage;
  final String weekday;
  final Function() onCancellPressed;
  final Function() onReschedulePressed;
  final Function() onCardPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
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
                    width: 100,
                    child: clinicImage == ''
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(AppAssets.avatar),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              clinicImage,
                              fit: BoxFit.cover,
                            ),
                          )),
                GlobalVariabels.horizontal10,
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
                              color: const Color(0xFF007DCC),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Upcoming',
                              style: TextStyle(
                                color: Color(0xFF007DCC),
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
            const Divider(),
            Row(
              children: [
                AppointmentButtons(
                    textColor: AppColor.primary,
                    label: 'Cancel',
                    buttonColor: AppColor.primary.withOpacity(.20),
                    onTap: onCancellPressed),
                AppointmentButtons(
                    textColor: Colors.white,
                    label: 'Reschedule',
                    buttonColor: AppColor.primary,
                    onTap: onReschedulePressed),
              ],
            )
          ],
        ),
      ),
    );
  }
}
