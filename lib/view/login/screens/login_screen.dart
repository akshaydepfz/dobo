import 'dart:ui';

import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width * .60,
                child: const Text(
                  'Welcome back to Doctor app,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary),
                ),
              ),
              SizedBox(
                height: height * .20,
              ),
              const Text(
                'Sign in to continue!',
                style: TextStyle(color: AppColor.grey4),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                width: width,
                decoration: BoxDecoration(
                    color: AppColor.grey1,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: const [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: AppColor.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
