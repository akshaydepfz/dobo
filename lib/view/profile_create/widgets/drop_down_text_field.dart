import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  const DropDownTextField({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hint,
  });

  final List<String> items;
  final String? selectedValue;
  final Function(String? v) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.grey1, borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          SizedBox(height: 20, width: 20, child: Image.asset(AppIcons.gender)),
          Expanded(
            child: DropdownButtonFormField2<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
              isExpanded: true,
              hint: Text(
                hint,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              items: items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: onChanged,
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 30,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
