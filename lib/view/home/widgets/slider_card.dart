import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.width, required this.title, required this.description,
  });

  final double width;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
    
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          end: Alignment.topCenter,
          colors: [
            Color(0xFF00776D),
            Color(0xFF00DCC9),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 05,
          ),
          Text(
           description,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
