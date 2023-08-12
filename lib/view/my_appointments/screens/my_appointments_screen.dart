import 'package:dobo/common/common_loading.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/appointment/screens/cancell_appointment.dart';
import 'package:dobo/view/appointment/screens/date_slot_select.dart';
import 'package:dobo/view/appointment/screens/reschedule_appointment.dart';
import 'package:dobo/view/my_appointments/screens/appointment_view.dart';
import 'package:dobo/view/my_appointments/services/appointment_services.dart';
import 'package:dobo/view/my_appointments/widgets/cancelled_card.dart';
import 'package:dobo/view/my_appointments/widgets/completed_card.dart';
import 'package:dobo/view/my_appointments/widgets/upcoming_card.dart';
import 'package:dobo/view/review/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Provider.of<AppointmentService>(context, listen: false)
        .getUpcomingAppointments();
    Provider.of<AppointmentService>(context, listen: false)
        .getCompletdAppointments();
    Provider.of<AppointmentService>(context, listen: false)
        .getCancelledAppintments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentService>(context);
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("My Appointment"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorWeight: 3,
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              labelColor: AppColor.primary,
              unselectedLabelColor: Colors.grey.shade400,
              controller: tabController,
              indicatorColor: AppColor.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Text('Upcoming'),
                Text('Completed'),
                Text('Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  provider.upcomingAppontments == null
                      ? const Center(
                          child: CommonLoadingWidget(),
                        )
                      : provider.upcomingAppontments!.isEmpty
                          ? const Center(
                              child: Text('No Appointments Found!'),
                            )
                          : ListView.builder(
                              itemCount: provider.upcomingAppontments!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return UpComingCard(
                                  onCardPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentViewScreen(
                                                    doctorId: provider
                                                        .upcomingAppontments![i]
                                                        .schedule!
                                                        .doctor,
                                                    clinicId: provider
                                                        .upcomingAppontments![i]
                                                        .schedule!
                                                        .clinic!,
                                                    date: provider
                                                        .upcomingAppontments![i]
                                                        .schedule!
                                                        .created!,
                                                    time: provider
                                                        .upcomingAppontments![i]
                                                        .schedule!
                                                        .startTime!,
                                                    tokenNo: provider
                                                        .upcomingAppontments![i]
                                                        .tokenNumber!
                                                        .toString(),
                                                    name: provider
                                                        .upcomingAppontments![i]
                                                        .patient!
                                                        .fullName!,
                                                    gender:
                                                        provider
                                                            .upcomingAppontments![
                                                                i]
                                                            .patient!
                                                            .gender!,
                                                    age: provider
                                                        .upcomingAppontments![i]
                                                        .patient!
                                                        .dob!,
                                                    problem: provider
                                                            .upcomingAppontments![
                                                                i]
                                                            .reason ??
                                                        "")));
                                  },
                                  onCancellPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CancellAppointment(
                                                    appointmentId: provider
                                                        .upcomingAppontments![i]
                                                        .id!)));
                                  },
                                  onReschedulePressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RescheduleAppointment(
                                                  appointmentId: provider
                                                      .upcomingAppontments![i]
                                                      .id!,
                                                  doctorId: provider
                                                      .upcomingAppontments![i]
                                                      .schedule!
                                                      .doctor,
                                                )));
                                  },
                                  weekday: provider.upcomingAppontments![i]
                                      .schedule!.weekday!,
                                  clinicName: provider
                                      .upcomingAppontments![i].clinicName!,
                                  doctorName: provider
                                      .upcomingAppontments![i].doctorName!,
                                  time: provider.upcomingAppontments![i]
                                      .schedule!.startTime!
                                      .toString()
                                      .substring(0, 5),
                                  clinicImage: provider
                                      .upcomingAppontments![i].clinicPhoto,
                                );
                              }),
                  provider.completedAppontments == null
                      ? const Center(
                          child: CommonLoadingWidget(),
                        )
                      : provider.completedAppontments!.isEmpty
                          ? const Center(
                              child: Text('No Appointments Found!'),
                            )
                          : ListView.builder(
                              itemCount: provider.completedAppontments!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return CompletedCard(
                                  onCardPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AppointmentViewScreen(
                                                doctorId: provider
                                                    .completedAppontments![i]
                                                    .schedule!
                                                    .doctor,
                                                clinicId: provider
                                                    .completedAppontments![i]
                                                    .schedule!
                                                    .clinic!,
                                                date: provider
                                                    .completedAppontments![i]
                                                    .schedule!
                                                    .created!,
                                                time: provider
                                                    .completedAppontments![i]
                                                    .schedule!
                                                    .startTime!,
                                                tokenNo: provider
                                                    .completedAppontments![i]
                                                    .tokenNumber!
                                                    .toString(),
                                                name: provider
                                                    .completedAppontments![i]
                                                    .patient!
                                                    .fullName!,
                                                gender: provider
                                                    .completedAppontments![i]
                                                    .patient!
                                                    .gender!,
                                                age: provider
                                                    .completedAppontments![i]
                                                    .patient!
                                                    .dob!,
                                                problem: provider
                                                        .completedAppontments![
                                                            i]
                                                        .reason ??
                                                    "")));
                                  },
                                  onLeaveAReview: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ReviewScreen(
                                                  doctorId: '',
                                                  doctorImage: '',
                                                  doctorNAme: '',
                                                )));
                                  },
                                  onReschedulePressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DateSelectingScreen(
                                          doctorId: provider.doctorDetail!.id,
                                          isRechedule: false,
                                          appointmentId: '',
                                          clinicID: '',
                                          isInsideClinic: false,
                                        ),
                                      ),
                                    );
                                  },
                                  weekday: provider.completedAppontments![i]
                                      .schedule!.weekday!,
                                  clinicName: provider
                                      .completedAppontments![i].clinicName!,
                                  doctorName: provider
                                      .completedAppontments![i].doctorName!,
                                  time: provider.completedAppontments![i]
                                      .schedule!.startTime!
                                      .toString()
                                      .substring(0, 5),
                                  clinicImage: provider
                                      .upcomingAppontments![i].clinicPhoto,
                                );
                              }),
                  provider.cancelleddAppontments == null
                      ? const Center(
                          child: CommonLoadingWidget(),
                        )
                      : provider.cancelleddAppontments!.isEmpty
                          ? const Center(
                              child: Text('No Appointments Found!'),
                            )
                          : ListView.builder(
                              itemCount: provider.cancelleddAppontments!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return CancelldCard(
                                  weekday: provider.cancelleddAppontments![i]
                                      .schedule!.weekday!,
                                  clinicName: provider
                                      .cancelleddAppontments![i].clinicName!,
                                  doctorName: provider
                                      .cancelleddAppontments![i].doctorName!,
                                  time: provider.cancelleddAppontments![i]
                                      .schedule!.startTime!
                                      .toString()
                                      .substring(0, 5),
                                  clinicImage: provider
                                      .cancelleddAppontments![i].clinicPhoto,
                                );
                              }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
