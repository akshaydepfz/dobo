import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile/services/profile_services.dart';
import 'package:dobo/view/profile/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileService>(context, listen: false).getProfileDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProfileService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  provider.userModel == null
                      ? const Center(
                          child: LinearProgressIndicator(
                          minHeight: 1,
                        ))
                      : Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: AppColor.primary,
                                  )),
                              child: provider.userModel!.image == ""
                                  ? Image.asset(AppAssets.avatar)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: Image.network(
                                        provider.userModel!.image,
                                        fit: BoxFit.cover,
                                      )),
                            ),
                            GlobalVariabels.horizontal10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${provider.userModel!.firstName} ${provider.userModel!.lastName}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  provider.userModel!.email,
                                ),
                              ],
                            ),
                          ],
                        ),
                  GlobalVariabels.vertical10,
                  GlobalVariabels.vertical10,
                  ProfileTile(
                      title: 'Articles',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.articleScreen);
                      }),
                  ProfileTile(
                      title: 'Edit Profile',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.editProfile);
                      }),
                  ProfileTile(title: 'Privacy Settings', onTap: () {}),
                  ProfileTile(title: 'Help Center', onTap: () {}),
                  ProfileTile(title: 'Contact Us', onTap: () {}),
                  ProfileTile(
                      title: 'Logout',
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GlobalVariabels.vertical10,
                                        const Divider(),
                                        const Text(
                                          'Are you sure want logout?',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        GlobalVariabels.vertical10,
                                        PrimaryButton(
                                            onTap: () {
                                              provider.logOut(context);
                                            },
                                            label: 'Logout'),
                                        SecondaryButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            label: 'Cancel')
                                      ],
                                    ),
                                  ),
                                ));
                      }),
                  ProfileTile(
                    title: 'Delete Account',
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Delete Account',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GlobalVariabels.vertical10,
                                      const Divider(),
                                      const Text(
                                        'Are you sure want delete your account?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      GlobalVariabels.vertical10,
                                      PrimaryButton(
                                          onTap: () {
                                            provider.logOut(context);
                                          },
                                          label: 'Delete Account'),
                                      SecondaryButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          label: 'Cancel')
                                    ],
                                  ),
                                ),
                              ));
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
