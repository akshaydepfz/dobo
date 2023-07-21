import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: const [
              GlobalVariabels.vertical15,
              ContactUsCard(
                  icon: Icons.mail_outline_rounded,
                  title: 'Email Us',
                  value: 'info@dobo.co.in'),
              GlobalVariabels.vertical15,
              ContactUsCard(
                  icon: Icons.phone_outlined,
                  title: 'Call Us',
                  value: '+91 7356396921'),
              GlobalVariabels.vertical15,
              ContactUsCard(
                  icon: Icons.place_outlined,
                  title: 'Visit Us',
                  value:
                      'Emline Business Hub, PMK Building, Behind Bus Stand, Ramanattukara'),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary,
          ),
          child: Center(
              child: Icon(
            icon,
            color: Colors.white,
          )),
        ),
        GlobalVariabels.horizontal10,
        GlobalVariabels.horizontal10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .70,
              child: Text(
                value,
                style: const TextStyle(color: AppColor.primary),
              ),
            )
          ],
        )
      ],
    );
  }
}
