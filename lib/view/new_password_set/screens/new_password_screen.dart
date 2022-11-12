import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class NewPasswordSet extends StatelessWidget {
  const NewPasswordSet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryAppbar(title: 'New password'),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'enter new password and conirm.',
                style: TextStyle(fontSize: 16, color: AppColor.grey4),
              ),
            ),
            SizedBox(
              height: height * .10,
            ),
            PrimaryTextField(
              width: width,
              hintText: 'Enter new password',
              icon: AppIcons.mail,
              onChanged: (value) {},
            ),
            PrimaryTextField(
              width: width,
              hintText: 'Confirm your password',
              icon: AppIcons.mail,
              onChanged: (value) {},
            ),
            PrimaryButton(onTap: () {}, label: 'Save')
          ],
        ),
      ),
    );
  }
}
