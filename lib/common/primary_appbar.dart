import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class PrimaryAppbar extends StatelessWidget {
  const PrimaryAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 20,
              child: Image.asset(
                AppIcons.arrowBack,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          GlobalVariabels.horizontal10,
        ],
      ),
    );
  }
}
