import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:dobo/view/profile_create/widgets/drop_down_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileCreateScreen extends StatelessWidget {
  const ProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileCreateProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Fill Your Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GlobalVariabels.vertical10, GlobalVariabels.vertical10,
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => provider.pickImage(),
                      child: SizedBox(
                        height: height * .12,
                        width: height * .12,
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                            AppAssets.avatar,
                          ),
                          child: provider.image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.file(
                                    provider.image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => provider.pickImage(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFEEFCFA),
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.camara),
                        ),
                      ),
                    ),
                  ],
                ),
                GlobalVariabels.vertical15,

                // SizedBox(
                //   width: width * .65,
                //   child: const Text(
                //     'Create DOBO Patient account,',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontSize: 26,
                //         fontWeight: FontWeight.w500,
                //         color: AppColor.primary),
                //   ),
                // ),

                // const Text(
                //   'Sign up to get started!',
                //   style: TextStyle(color: AppColor.grey4, fontSize: 16),
                // ),
                GlobalVariabels.vertical15,

                PrimaryTextField(
                    width: width,
                    hintText: 'Enter your name',
                    icon: AppIcons.lock,
                    onChanged: (value) {
                      provider.onUserNameChanged(value);
                    }),

                GestureDetector(
                  onTap: () => provider.selectDate(context),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5.0),
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColor.grey1,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppIcons.calenderPng)),
                        GlobalVariabels.horizontal10,
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              provider.selectedDate == null
                                  ? 'Date Of Birth'
                                  : "${provider.selectedDate!.day}-${provider.selectedDate!.month}-${provider.selectedDate!.year}",
                              style: const TextStyle(color: AppColor.grey4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DropDownTextField(
                  items: const ["Male", "Female", "Others"],
                  selectedValue: 'Male',
                  onChanged: (v) {
                    provider.onGenderChange(v!);
                  },
                  hint: 'Male',
                ),
                PrimaryTextField(
                    width: width,
                    hintText: 'Whatsapp Number',
                    icon: AppIcons.whatsapp,
                    onChanged: (value) {
                      provider.onAddressChanged(value);
                    }),
                PrimaryTextField(
                    width: width,
                    hintText: 'Email ID',
                    icon: AppIcons.mail,
                    onChanged: (value) {
                      provider.onEmailChanged(value);
                    }),
                PrimaryTextField(
                    width: width,
                    hintText: 'Address',
                    icon: AppIcons.locationPng,
                    onChanged: (value) {
                      provider.onAddressChanged(value);
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
                      value: provider.acceptTc,
                      onChanged: (inputValue) {
                        provider.checkBoxClick();
                      },
                    ),
                    Row(
                      children: [
                        const Text('I accept all the'),
                        TextButton(
                            onPressed: () {
                              provider.launchURL();
                            },
                            child: const Text(
                              'terms and conditions',
                              style: TextStyle(color: AppColor.primary),
                            ))
                      ],
                    )
                  ],
                ),
                GlobalVariabels.vertical15,
                PrimaryButton(
                    isLoading: provider.isoading,
                    onTap: () {
                      provider.profileCreate(context);
                    },
                    label: 'Sign Up'),

                GlobalVariabels.vertical15,
                GlobalVariabels.vertical15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
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
