import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(
              title: 'Change password',
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Please enter your email addrees. You will receive a link to create a new password via email.',
                style: TextStyle(fontSize: 16, color: AppColor.grey4),
              ),
            ),
            SizedBox(
              height: height * .10,
            ),
            PrimaryTextField(
                width: width,
                hintText: 'Enter your registered mail',
                icon: AppIcons.mail,
                onChanged: (value) {}),
            PrimaryButton(onTap: () {
              Navigator.pushReplacementNamed(context,RouteConstants.newPassword);
            }, label: 'Send')
          ],
        ),
      ),
    );
  }
}
