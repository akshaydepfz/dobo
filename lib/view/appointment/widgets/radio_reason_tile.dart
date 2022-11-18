import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class ReasonTile extends StatelessWidget {
  const ReasonTile({
    Key? key,
    required this.resone,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String resone;
  final bool isSelected;
  final Function(bool? l) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              focusColor: AppColor.primary,
              activeColor: AppColor.primary,
              value: isSelected,
              groupValue: true,
              onChanged: onTap,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              resone,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
