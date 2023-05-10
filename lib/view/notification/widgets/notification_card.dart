import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.isWrong,
    required this.title,
    required this.msg,
    required this.time,
    required this.onTap,
  }) : super(key: key);
  final bool isWrong;
  final String title;
  final String msg;
  final String time;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: isWrong
                        ? SvgPicture.asset(AppIcons.alert)
                        : SvgPicture.asset(AppIcons.done)),
                GlobalVariabels.horizontal10,
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GlobalVariabels.vertical10,
            Text(
              msg,
              style: const TextStyle(color: AppColor.grey4),
            ),
            GlobalVariabels.vertical10,
            const Divider(),
            GlobalVariabels.vertical10,
            Text(
              time,
              style: const TextStyle(fontSize: 15, color: AppColor.grey4),
            )
          ],
        ),
      ),
    );
  }
}
