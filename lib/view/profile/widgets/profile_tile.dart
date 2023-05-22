import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  ProfileTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.grey3,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
