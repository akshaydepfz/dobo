import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/appointment/services/patient_details_service.dart';
import 'package:dobo/view/appointment/widgets/named_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<PatientDetailsProvider>(context);
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
                    // const Text(
                    //   'Personal Information',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'Full Name',
                    //   onChanged: (value) {},
                    //   hint: 'Full Name',
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'Gender',
                    //   onChanged: (value) {},
                    //   hint: 'Male',
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'Age',
                    //   onChanged: (value) {},
                    //   hint: 'Age',
                    // ),
                    // GlobalVariabels.vertical15,
                    // const Divider(),
                    // GlobalVariabels.vertical15,
                    // const Text(
                    //   'Contact Information',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'Number',
                    //   onChanged: (value) {},
                    //   hint: 'Number',
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'E mail',
                    //   onChanged: (value) {},
                    //   hint: 'E mail',
                    // ),
                    // GlobalVariabels.vertical15,
                    // NamedTextfield(
                    //   title: 'Address',
                    //   onChanged: (value) {},
                    //   hint: 'Address',
                    // ),
                    // GlobalVariabels.vertical15,
                    // const Divider(),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => provider.patientChange(),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: provider.isPatient
                                    ? AppColor.primary
                                    : AppColor.primary.withOpacity(0.2),
                              ),
                              child: Center(
                                child: Text(
                                  'Me',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: provider.isPatient
                                          ? Colors.white
                                          : AppColor.primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GlobalVariabels.horizontal10,
                        Expanded(
                          child: GestureDetector(
                            onTap: () => provider.patientChange(),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: provider.isPatient
                                    ? AppColor.primary.withOpacity(0.2)
                                    : AppColor.primary,
                              ),
                              child: Center(
                                child: Text(
                                  'Relatives',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: provider.isPatient
                                          ? AppColor.primary
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (!provider.isPatient)
                      Column(
                        children: [
                          GlobalVariabels.vertical15,
                          GestureDetector(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.primary.withOpacity(0.2)),
                              child: const Center(
                                child: Text(
                                  '+ Add Relative',
                                  style: TextStyle(
                                      color: AppColor.primary, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
              PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.reviewSummary);
                  },
                  label: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
