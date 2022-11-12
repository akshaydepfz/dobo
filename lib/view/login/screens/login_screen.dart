import 'package:dobo/common/password_text_field.dart';
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
                height: height * .20,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
