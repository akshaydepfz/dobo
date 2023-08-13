import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  ProfileTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      title: Text(
        title,
        style:
            TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
