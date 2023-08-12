import 'package:flutter/material.dart';

class AppointmentButtons extends StatelessWidget {
  const AppointmentButtons({
    Key? key,
    required this.textColor,
    required this.label,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);
  final Color textColor;
  final String label;
  final Color buttonColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(9),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
