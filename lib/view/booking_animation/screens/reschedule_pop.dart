import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReschedulePop extends StatelessWidget {
  const ReschedulePop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: height*.12,bottom: height*.05),
              child: SizedBox(
              height: height * .20,
              child: SvgPicture.asset(AppAssets.reschedulePop)),
            ),
          ),
          const Text(
          'Rescheduling Success!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ), 
        const Padding(
          padding:  EdgeInsets.symmetric(vertical: 20),
          child:  Text(
            'Appointment successfuly changed.\nYou will receive a notification and\n the doctor you selected will\n contact you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: AppColor.grey4,
            ),
          ),
        ),
        const Spacer(),
        PrimaryButton(onTap: (){}, label:'View Appointment'),
        SecondaryButton(onTap: (){}, label:'Cancel'),
        GlobalVariabels.vertical15,       
       ],
      ),
    );
  }
}