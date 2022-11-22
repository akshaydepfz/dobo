import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(title: 'Notifications'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children:  [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,RouteConstants.sessionEndPop);
                      },
                      child:const NotificationCard(
                        isWrong: false,
                        title: 'Appointment Success!',
                        msg:
                            'You have successfully booked an appointment with Dr Alan Warson on December 24,2024, 12:00 am Don\'t Forget to activate your reminder',
                        time: 'Aug 24, 2022 at 9:41 AM',
                      ),
                    ),
                    NotificationCard(
                      isWrong: true,
                      title: 'Appointment Cancelled!',
                      msg:
                          'You You have successfully canceled your appointment with Dr.Alan Watson on December 24, 2024.',
                      time: 'Yesterday at 9:41 AM',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
