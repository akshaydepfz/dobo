import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    Key? key,
    required this.width,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.obscure,
    required this.onObscureClicked,
    required this.passwordController,
  }) : super(key: key);

  final double width;
  final String hintText;
  final bool obscure;
  final String icon;
  final Function(String s) onChanged;
  final Function() onObscureClicked;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
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
              controller: passwordController,
              style: const TextStyle(color: AppColor.black),
              obscureText: obscure,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 14),
                  border: InputBorder.none,
                  suffix: GestureDetector(
                    onTap: onObscureClicked,
                    child: SizedBox(
                      height: 16,
                      child: obscure
                          ? Image.asset(
                              AppIcons.visibleOff,
                              color: AppColor.grey2,
                            )
                          : Image.asset(
                              AppIcons.visible,
                              color: AppColor.grey2,
                            ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
