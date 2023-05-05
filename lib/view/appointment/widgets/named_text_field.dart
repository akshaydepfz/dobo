import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class NamedTextfield extends StatelessWidget {
  const NamedTextfield({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);
  final String title;
  final Function(String value) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        GlobalVariabels.vertical10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: AppColor.grey1, borderRadius: BorderRadius.circular(12)),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 14, color: AppColor.grey2)),
          ),
        ),
      ],
    );
  }
}
