import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/appointment/widgets/named_text_field.dart';
import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryAppbar(title: 'Patient Details'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'Full Name',
                      onChanged: (value) {},
                      hint: 'Full Name',
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'Gender',
                      onChanged: (value) {},
                      hint: 'Male',
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'Age',
                      onChanged: (value) {},
                      hint: 'Age',
                    ),
                    GlobalVariabels.vertical15,
                    const Divider(),
                    GlobalVariabels.vertical15,
                    const Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'Number',
                      onChanged: (value) {},
                      hint: 'Number',
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'E mail',
                      onChanged: (value) {},
                      hint: 'E mail',
                    ),
                    GlobalVariabels.vertical15,
                    NamedTextfield(
                      title: 'Address',
                      onChanged: (value) {},
                      hint: 'Address',
                    ),
                    GlobalVariabels.vertical15,
                    const Divider(),
                    GlobalVariabels.vertical15,
                    const Text(
                      'Write Your Problem',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalVariabels.vertical15,
                        const Text('Description'),
                        GlobalVariabels.vertical10,
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: width,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.grey1,
                          ),
                          child: const TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                                hintText: 'Description',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 14, color: AppColor.grey2)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GlobalVariabels.vertical15,
              PrimaryButton(onTap: () {
                Navigator.pushNamed(context, RouteConstants.reviewSummary);
              }, label: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
