import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/appointment/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DateSelectingScreen extends StatefulWidget {
  final String doctorId;
  const DateSelectingScreen({super.key, required this.doctorId});

  @override
  State<DateSelectingScreen> createState() => _DateSelectingScreenState();
}

class _DateSelectingScreenState extends State<DateSelectingScreen> {
  @override
  void initState() {
    Provider.of<BookingService>(context, listen: false)
        .getSlotes(widget.doctorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(title: 'Appointment Booking'),
              Padding(
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
                        onTap: (v) {
                          provider.onDateChanged(v.date!);
                        },
                        initialDisplayDate: provider.selectdDate,
                        cellBorderColor: Colors.transparent,
                        todayHighlightColor: Colors.white,
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
                    provider.slotes == null
                        ? const CircularProgressIndicator()
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.slotes!.length,
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
                                child: Center(
                                  child: Text(
                                    provider.slotes![i].startTime,
                                    style: const TextStyle(
                                        color: AppColor.primary),
                                  ),
                                ),
                              );
                            }),
                  ],
                ),
              ),
              PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.patientScreen);
                  },
                  label: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
