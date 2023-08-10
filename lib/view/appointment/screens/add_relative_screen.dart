import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/primary_text_field.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/appointment/services/booking_service.dart';

import 'package:dobo/view/profile_create/widgets/drop_down_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRelativeScreen extends StatelessWidget {
  const AddRelativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingService>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Relative'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextField(
                width: width,
                hintText: 'Enter relative name',
                icon: AppIcons.lock,
                onChanged: (value) => provider.onNameChanged(value),
              ),
              DropDownTextField(
                items: const ["Male", "Female"],
                selectedValue: 'Male',
                onChanged: (v) {},
                hint: 'Male',
              ),
              GestureDetector(
                onTap: () => provider.selectDate(context),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
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
              const Spacer(),
              PrimaryButton(
                  isLoading: provider.isLoading,
                  onTap: () => provider.addPatient(context),
                  label: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}
