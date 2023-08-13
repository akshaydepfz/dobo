import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/appointment/screens/add_relative_screen.dart';
import 'package:dobo/view/appointment/screens/review_summery.dart';
import 'package:dobo/view/appointment/services/booking_service.dart';
import 'package:dobo/view/profile/services/profile_services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  @override
  void initState() {
    Provider.of<BookingService>(context, listen: false).getRelatives();
    Provider.of<ProfileService>(context, listen: false).getProfileDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<BookingService>(context);
    final userProvider = Provider.of<ProfileService>(context);
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
                                borderRadius: BorderRadius.circular(8.0),
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
                                borderRadius: BorderRadius.circular(8.0),
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
                          Visibility(
                            visible: provider.relatives != null,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.relatives!.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              value: i,
                                              groupValue: provider
                                                  .selectedRelativeIndex,
                                              onChanged: (b) => provider
                                                  .onRelaviteIndexChange(i),
                                            ),
                                            GlobalVariabels.horizontal10,
                                            Text(
                                                provider.relatives![i].fullName)
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            provider.deleteRelative(
                                                provider.relatives![i].pk);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: AppColor.grey3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          GlobalVariabels.vertical15,
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddRelativeScreen()));
                            },
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
                          child: TextField(
                            maxLines: 10,
                            onChanged: (v) => provider.ondescriptionChange(v),
                            decoration: const InputDecoration(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewSummaryScreen(
                                  time: provider
                                      .slotes![provider.selectedSlotIndex]
                                      .startTime,
                                  date:
                                      "${provider.selectdappointmentDate.day}-${provider.selectdappointmentDate.month}-${provider.selectdappointmentDate.year}",
                                  problem: provider.description,
                                  doctorID: provider.doctorID,
                                  name: provider.isPatient
                                      ? userProvider.userModel!.fullName
                                      : provider
                                          .relatives![
                                              provider.selectedRelativeIndex]
                                          .fullName,
                                  gender: provider.isPatient
                                      ? userProvider.userModel!.gender
                                      : provider
                                          .relatives![
                                              provider.selectedRelativeIndex]
                                          .gender,
                                  age: provider.isPatient
                                      ? userProvider.userModel!.dob.year
                                          .toString()
                                      : provider
                                          .relatives![
                                              provider.selectedRelativeIndex]
                                          .dob
                                          .year
                                          .toString(),
                                )));
                  },
                  label: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
