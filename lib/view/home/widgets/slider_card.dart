import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.width,
    required this.title,
    required this.image,
  });

  final double width;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
