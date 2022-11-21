import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/view/my_appointments/widgets/completed_card.dart';
import 'package:dobo/view/my_appointments/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return const UpComingCard();
                      }),
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return const CompletedCard();
                      }),
                  const Text('data'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentButtons extends StatelessWidget {
  const AppointmentButtons({
    Key? key,
    required this.textColor,
    required this.label,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);
  final Color textColor;
  final String label;
  final Color buttonColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(13),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
