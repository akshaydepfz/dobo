import 'package:dobo/common/password_text_field.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/view/login/services/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: width * .60,
                  child: const Text(
                    'Welcome back to Doctor app,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary),
                  ),
                ),
                SizedBox(
                  height: height * .17,
                ),
                const Text(
                  'Sign in to continue!',
                  style: TextStyle(color: AppColor.grey4, fontSize: 16),
                ),
                GlobalVariabels.vertical15,
                PrimaryTextField(
                  width: width,
                  hintText: 'Enter Your mail',
                  icon: AppIcons.person,
                  onChanged: (String value) {},
                ),
                PasswordTextField(
                  obscure: loginProvider.obsureText,
                  width: width,
                  hintText: 'Enter Your Password',
                  icon: AppIcons.lock,
                  onChanged: (String value) {},
                  onObscureClicked: () {
                    loginProvider.onObscureClicked();
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                    ),
                  ),
                ),
                PrimaryButton(onTap: () {}, label: 'Sign In'),
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
                GlobalVariabels.vertical15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(onPressed: () {}, child: const Text('Sign up'))
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

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: AppColor.grey2,
            )),
        height: 60,
        width: 60,
        child: Center(
          child: SizedBox(height: 25, child: Image.asset(icon)),
        ),
      ),
    );
  }
}
