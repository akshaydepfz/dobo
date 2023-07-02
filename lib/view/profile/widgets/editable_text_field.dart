import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class EditableTextField extends StatelessWidget {
  const EditableTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String value) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.grey1),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
