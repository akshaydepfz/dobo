import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/my_appointments/widgets/appointment_buttons.dart';
import 'package:flutter/material.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,RouteConstants.appointmentView);
      },
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
                SizedBox(height: 100, child: Image.asset(AppAssets.health)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'The family care',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Dr. Rubayet Sakib',
                      style: TextStyle(color: AppColor.grey4),
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
                        const Text(
                          'Today',
                          style: TextStyle(fontSize: 14, color: AppColor.grey4),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        const Text(
                          '08:30 AM',
                          style: TextStyle(fontSize: 14, color: AppColor.grey4),
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
                    onTap: () {
                       Navigator.pushNamed(context, RouteConstants.cancelAppointment);
                    }),
                AppointmentButtons(
                    textColor: Colors.white,
                    label: 'Reschedule',
                    buttonColor: AppColor.primary,
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstants.resceduleAppointment);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
