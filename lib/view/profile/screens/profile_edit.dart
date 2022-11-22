import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/view/profile/widgets/editable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});
  final TextEditingController _nameController =
      TextEditingController(text: 'Martin Bator');
  final TextEditingController _phoneController =
      TextEditingController(text: '+91 2649351476');
  final TextEditingController _emailController =
      TextEditingController(text: 'martinbator@gmail.com');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'Edit Profile'),
            Stack(
              children: [
                SizedBox(
                  height: height * .12,
                  width: height * .12,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      AppAssets.avatar,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEEFCFA),
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.camara),
                    )),
              ],
            ),
            GlobalVariabels.vertical15,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    EditableTextField(
                      controller: _nameController,
                      onChanged: (value) {},
                    ),
                    GlobalVariabels.vertical15,
                    EditableTextField(
                      controller: _phoneController,
                      onChanged: (value) {},
                    ),
                    GlobalVariabels.vertical15,
                    EditableTextField(
                      controller: _emailController,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(onTap: () {
              Navigator.pop(context);
            }, label: 'Save Changes')
          ],
        ),
      ),
    );
  }
}
