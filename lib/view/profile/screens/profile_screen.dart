import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/model/core/assets/app_assets.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Row(
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
                        child: Image.asset(AppAssets.avatar),
                      ),
                      GlobalVariabels.horizontal10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Martin Bator',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'martinbator@gmail.com',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GlobalVariabels.vertical10,
                  GlobalVariabels.vertical10,
                  ProfileTile(title: 'Articles', onTap: () {
                    Navigator.pushNamed(context,RouteConstants.articleScreen);
                  }),
                  ProfileTile(title: 'Edit Profile', onTap: () {
                    Navigator.pushNamed(context,RouteConstants.editProfile);
                  }),
                  ProfileTile(title: 'Change Password', onTap: () {
                    Navigator.pushNamed(context,RouteConstants.changePassword);
                  }),
                  ProfileTile(title: 'Privacy Settings', onTap: () {}),
                  ProfileTile(title: 'Help Center', onTap: () {}),
                  ProfileTile(title: 'Contact Us', onTap: () {}),
                  ProfileTile(title: 'Logout', onTap: () {}),
                  ProfileTile(
                    title: 'Delete Account',
                    onTap: () {},
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
