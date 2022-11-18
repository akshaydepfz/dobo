import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DateSelectingScreen extends StatelessWidget {
  const DateSelectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'Appointment Booking'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(4.0, 4.0),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SfCalendar(
                        cellBorderColor: Colors.transparent,
                        todayHighlightColor: AppColor.primary,
                        view: CalendarView.month,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    GlobalVariabels.vertical15,
                    const Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                childAspectRatio: 3.0,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.primary.withOpacity(0.2),
                            ),
                            child: const Center(
                              child: Text(
                                '08:00 AM',
                                style: TextStyle(color: AppColor.primary),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            PrimaryButton(onTap: () {}, label: 'Next')
          ],
        ),
      ),
    );
  }
}
