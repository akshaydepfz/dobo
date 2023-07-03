import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/otp/services/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:provider/provider.dart';

class OtpAuthScreen extends StatefulWidget {
  const OtpAuthScreen({super.key});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<SigninProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .30,
                ),
                GlobalVariabels.vertical15,
                GlobalVariabels.vertical15,
                const Text(
                  "Enter code sent to your\nnumber",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                GlobalVariabels.vertical10,
                Text(
                  'Please type the verification code sent\nto +91 ${loginProvider.mobile}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColor.grey3),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PinCodeTextField(
                    controller: controller,
                    cursorColor: AppColor.grey3,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(6.0),
                      fieldHeight: 55,
                      fieldWidth: 55,
                      borderWidth: 1,
                      activeFillColor: Colors.transparent,
                      activeColor: AppColor.grey2,
                      disabledColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      selectedColor: AppColor.grey2,
                      selectedFillColor: Colors.transparent,
                      inactiveColor: AppColor.grey2,
                    ),
                    animationDuration: const Duration(milliseconds: 300),

                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    onCompleted: (v) {
                      loginProvider.verifyOTP(context, v);
                    },
                    onChanged: (value) {
                 
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                GlobalVariabels.vertical15,
                PrimaryButton(
                  onTap: () =>
                      loginProvider.verifyOTP(context, controller.text),
                  label: "Confirm",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
