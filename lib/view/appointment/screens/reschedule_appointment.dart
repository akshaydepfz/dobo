import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/view/appointment/services/reshedule_radio_button.dart';
import 'package:dobo/view/appointment/widgets/radio_reason_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RescheduleAppointment extends StatelessWidget {
  RescheduleAppointment({super.key});

  List<Map> reasons = [
    {'reason': 'I’m having a schedule clash'},
    {'reason': 'I’m not available on schedule'},
    {'reason': 'I have a activity that can’t left behind'},
    {'reason': 'I just want to reschedule'},
    {'reason': 'Others'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<RescheduleRadioService>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'Reschedule Appointment'),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, i) {
                  return const Divider();
                },
                itemCount: reasons.length,
                itemBuilder: (context, i) {
                  return ReasonTile(
                    resone: reasons[i]['reason'],
                    isSelected: provider.selectedIndex == i,
                    onTap: (value) {
                      provider.onRadioButtonChanged(i);
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 150,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColor.grey1),
              child: const TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description...',
                  hintStyle: TextStyle(fontSize: 14, color: AppColor.grey3),
                ),
              ),
            ),
            PrimaryButton(
              onTap: () {},
              label: 'Next',
            )
          ],
        ),
      ),
    );
  }
}
