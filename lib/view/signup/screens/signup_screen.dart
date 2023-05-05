import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/signin/screens/signin_screen.dart';
import 'package:dobo/view/signup/services/signup_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signinProvider = Provider.of<SignUpService>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GlobalVariabels.vertical15,
                GlobalVariabels.vertical15,
                SizedBox(
                  width: width * .65,
                  child: const Text(
                    'Create Doctor app account,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary),
                  ),
                ),
                GlobalVariabels.vertical15,
                const Text(
                  'Sign up to get started!',
                  style: TextStyle(color: AppColor.grey4, fontSize: 16),
                ),
                GlobalVariabels.vertical15,
                GlobalVariabels.vertical15,
                PrimaryTextField(
                    width: width,
                    hintText: 'Enter your name',
                    icon: AppIcons.lock,
                    onChanged: (value) {
                      signinProvider.onUserNameChanged(value);
                    }),
                PrimaryTextField(
                    width: width,
                    hintText: 'Enter your email',
                    icon: AppIcons.mail,
                    onChanged: (value) {
                      signinProvider.onEmailChanged(value);
                    }),
                PrimaryTextField(
                    width: width,
                    hintText: 'Enter your password',
                    icon: AppIcons.lock,
                    onChanged: (value) {
                      signinProvider.onPasswordChanged(value);
                    }),
                PrimaryTextField(
                    width: width,
                    hintText: 'Confirm your password',
                    icon: AppIcons.lock,
                    onChanged: (value) {
                      signinProvider.onPassword2Changed(value);
                    }),
                Row(
                  children: [
                    Checkbox(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.primary,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      value: signinProvider.acceptTc,
                      onChanged: (inputValue) {
                        signinProvider.checkBoxClick();
                      },
                    ),
                    const Text('I accept all the terms and conditions')
                  ],
                ),
                GlobalVariabels.vertical15,
                PrimaryButton(
                    onTap: () {
                      signinProvider.signUp(context);
                    },
                    label: 'Sign Up'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: const [
                    Expanded(
                        child: Divider(
                      color: AppColor.grey2,
                    )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Or'),
                    ),
                    Expanded(
                        child: Divider(
                      color: AppColor.grey2,
                    )),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaCard(icon: AppIcons.facebook, onTap: () {}),
                    SocialMediaCard(icon: AppIcons.google, onTap: () {}),
                    SocialMediaCard(icon: AppIcons.apple, onTap: () {}),
                  ],
                ),
                GlobalVariabels.vertical15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteConstants.signInScreen);
                        },
                        child: const Text('Sign In'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
