import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/otp/services/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<SigninProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(AppAssets.appicon),
                GlobalVariabels.vertical15,
                SizedBox(
                  width: width * .60,
                  child: const Text(
                    'Welcome to DOBO!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary),
                  ),
                ),
                SizedBox(
                  height: height * .17,
                ),
                GlobalVariabels.vertical10,
                const Text(
                  'Enter your mobile\nnumber',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                const Text(
                  'We will send a code to your mobile number',
                  style: TextStyle(color: Colors.grey),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColor.grey1,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '+91',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.black,
                          )),
                      Expanded(
                        child: TextField(
                          onChanged: (v) =>
                              loginProvider.onUserNameChanged(v.trim()),
                          keyboardType: TextInputType.phone,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                GlobalVariabels.vertical10,
                PrimaryButton(
                    isLoading: loginProvider.isLoading,
                    onTap: () {
                      loginProvider.getOTP(context);
                    },
                    label: 'Send Message'),
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
