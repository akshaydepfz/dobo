import 'package:dobo/common/common_loading.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/my_appointments/services/appointment_services.dart';
import 'package:dobo/view/my_appointments/widgets/cancelled_card.dart';
import 'package:dobo/view/my_appointments/widgets/completed_card.dart';
import 'package:dobo/view/my_appointments/widgets/upcoming_card.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'My Appointment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                    child: Image.asset(AppIcons.search),
                  )
                ],
              ),
            ),
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
                      : ListView.builder(
                          itemCount: provider.upcomingAppontments!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            if (provider.upcomingAppontments!.isEmpty) {
                              return const Center(
                                child: Text('No Appointments Found!'),
                              );
                            }
                            return const UpComingCard();
                          }),
                  provider.completedAppontments == null
                      ? const Center(
                          child: CommonLoadingWidget(),
                        )
                      : ListView.builder(
                          itemCount: provider.completedAppontments!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            if (provider.upcomingAppontments!.isEmpty) {
                              return const Center(
                                child: Text('No Appointments Found!'),
                              );
                            }
                            return const CompletedCard();
                          }),
                  provider.cancelleddAppontments == null
                      ? const Center(
                          child: CommonLoadingWidget(),
                        )
                      : ListView.builder(
                          itemCount: provider.cancelleddAppontments!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            if (provider.upcomingAppontments!.isEmpty) {
                              return const Center(
                                child: Text('No Appointments Found!'),
                              );
                            }
                            return const CancelldCard();
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
