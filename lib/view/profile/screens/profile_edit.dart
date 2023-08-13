import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/profile/services/profile_services.dart';
import 'package:dobo/view/profile/widgets/editable_text_field.dart';
import 'package:dobo/view/profile_create/widgets/drop_down_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    Provider.of<ProfileService>(context, listen: false).setProfileEdit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileService>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        elevation: 0,
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //  const PrimaryAppbar(title: 'Edit Profile'),
            Stack(
              children: [
                SizedBox(
                  height: height * .12,
                  width: height * .12,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.grey2,
                        borderRadius: BorderRadius.circular(60)),
                    child: GestureDetector(
                      onTap: () => provider.pickImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Center(
                          child: provider.image != null
                              ? Image.file(provider.image!)
                              : provider.userModel!.image == ''
                                  ? Image.asset(
                                      AppAssets.avatar,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(provider.userModel!.image,
                                      fit: BoxFit.cover),
                        ),
                      ),
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
                      hint: 'Name',
                      controller: provider.nameController,
                      onChanged: (value) {},
                    ),
                    GlobalVariabels.vertical15,
                    EditableTextField(
                      hint: 'Phone Number',
                      controller: provider.phoneController,
                      onChanged: (value) {},
                    ),
                    GlobalVariabels.vertical15,
                    EditableTextField(
                      hint: 'Email',
                      controller: provider.emailController,
                      onChanged: (value) {},
                    ),
                    GlobalVariabels.vertical10,
                    DropDownTextField(
                      items: const ["Male", "Female", "Others"],
                      selectedValue: 'Male',
                      onChanged: (v) {
                        // provider.onGenderChange(v!);
                      },
                      hint: 'Male',
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
                onTap: () => provider.updateProfile(context),
                label: 'Save Changes')
          ],
        ),
      ),
    );
  }
}
