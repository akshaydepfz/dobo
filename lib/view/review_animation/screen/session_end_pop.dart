import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionEndPop extends StatelessWidget {
  const SessionEndPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: height*.1,bottom: height*.02),
              child: SizedBox(
              height: height * .20,
              child: SvgPicture.asset(AppAssets.bookingDone)),
            ),
          ),
          const Text(
          'The Consultation Session Has\nEnded!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ), 
        Container(
          margin:const EdgeInsets.only(top: 20),
          height: height*.19,width:width*.38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color:const Color(0xffBFBDBE)),
            image:const DecorationImage(fit: BoxFit.fill,
              image:AssetImage(AppAssets.doctor2))
          ),
        ),
        const Padding(
          padding:  EdgeInsets.symmetric(vertical: 12),
          child: Text('Dr. Rubayet Sakib',style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold
          ),),
        ),
        const Text('Dental Specialist',style: TextStyle(color: Color(0xff727272),
          fontSize: 16,fontWeight: FontWeight.w400
        ),),
        const SizedBox(height: 8,),
        const Text('The Family Care Clinic',style: TextStyle(color: Color(0xff727272),
          fontSize: 16,fontWeight: FontWeight.w400
        ),),
        const Divider(),
        const Spacer(),
        PrimaryButton(onTap: (){}, label:'Leave a Review'),
        SecondaryButton(onTap: (){}, label:'Back to Home'),
        GlobalVariabels.vertical15,       
       ],
      ),
    );
  }
}