import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    child: Image.asset(
                      AppIcons.arrowBack,
                    ),
                  ),
                  const Text(
                    'Forgot password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GlobalVariabels.horizontal10,
                ],
              ),
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
            PrimaryButton(onTap: () {}, label: 'Send')
          ],
        ),
      ),
    );
  }
}
