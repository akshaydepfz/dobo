import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.width,
    required this.doctor,
    required this.dateTime,
    required this.token,
    required this.clinic,
    required this.department,
  });

  final double width;
  final String doctor;
  final String dateTime;
  final String token;
  final String clinic;
  final String department;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12.0),
      height: 100,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF1B988D)),
        color: const Color(0xFFEEFCFA),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                doctor,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1B988D)),
              ),
              const SizedBox(
                width: 5,
              ),
              Text("- ${department}")
            ],
          ),
          Text(clinic),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateTime,
                style:
                    const TextStyle(fontSize: 15.0, color: Color(0xFF1B988D)),
              ),
              Text(
                token,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Color(0xFF1B988D)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
