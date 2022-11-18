import 'package:flutter/material.dart';

class GlobalVariabels {
  static const vertical15 = SizedBox(
    height: 15,
  );
  static const vertical10 = SizedBox(
    height: 10,
  );
  static const horizontal10 = SizedBox(
    width: 10,
  );
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.shade200,
      offset: const Offset(4.0, 4.0),
      blurRadius: 10,
      spreadRadius: 0,
    ),
  ];
}
