import 'dart:async';

import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSelectScreen extends StatelessWidget {
  LocationSelectScreen({super.key});
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(13.0),
        height: height / 2.2,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.grey1,
                ),
              ),
            ),
            GlobalVariabels.vertical15,
            const Text(
              'Malappuram, kerala, india',
              style: TextStyle(fontSize: 16),
            ),
            GlobalVariabels.vertical10,
            const Divider(),
            GlobalVariabels.vertical10,
            CommonTextField(
                onChanged: (value) {}, hint: 'Enter your your address'),
            GlobalVariabels.vertical15,
            CommonTextField(onChanged: (value) {}, hint: 'Work, Home,'),
            GlobalVariabels.vertical10,
            PrimaryButton(onTap: () {}, label: 'Confirm Location'),
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);
  final Function(String value) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColor.grey1, borderRadius: BorderRadius.circular(8.0)),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: AppColor.black),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: AppColor.grey3),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
