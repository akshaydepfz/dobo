import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/model/appointment_list_model.dart';
import 'package:dobo/view/appointment/screens/appointment_success_view.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookingSuccessPop extends StatelessWidget {
  final String tokenNo;
  final AppointmentListModel model;

  const BookingSuccessPop(
      {Key? key, required this.tokenNo, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavService>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * .12, bottom: height * .05),
                child: SizedBox(
                    height: height * .20,
                    child: SvgPicture.asset(AppAssets.bookingDone)),
              ),
            ),
            const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GlobalVariabels.vertical10,
            const Text(
              'Your Token Number is',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GlobalVariabels.vertical10,
            Text(
              tokenNo,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // GlobalVariabels.vertical10,
            // const Text(
            //   'Booking ID : 05842026',
            //   style: TextStyle(fontSize: 16, color: AppColor.grey4),
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Appointment successfuly booked.\n you will receive a notification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.grey4,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentSuccessView(
                              doctorId: model.schedule!.doctor,
                              clinicId: model.schedule!.clinic!,
                              date: model.schedule!.created!,
                              time: model.schedule!.startTime!,
                              tokenNo: model.tokenNumber!.toString(),
                              name: model.patient!.fullName!,
                              gender: model.patient!.gender!,
                              age: model.patient!.dob!,
                              problem: model.reason ?? "")));
                },
                label: 'View Appointment'),
            SecondaryButton(
                onTap: () {
                  bottomNavProvider.onTabClicked(0);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LandingScreen()));
                },
                label: 'Cancel'),
          ],
        ),
      ),
    );
  }
}
