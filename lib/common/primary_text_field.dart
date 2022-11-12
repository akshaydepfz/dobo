import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    required this.width,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  final double width;
  final String hintText;

  final String icon;
  final Function(String s) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      width: width,
      decoration: BoxDecoration(
          color: AppColor.grey1, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(height: 20, width: 20, child: Image.asset(icon)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(color: AppColor.black),
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
