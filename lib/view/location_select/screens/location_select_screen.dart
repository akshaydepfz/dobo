import 'dart:async';
import 'dart:developer';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/location_select/services/location_select_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  final _mapController = MapController(initMapWithUserPosition: true);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocationSelectService>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: OSMFlutter(
        controller: _mapController,
        trackMyPosition: true,
        initZoom: 12,
        minZoomLevel: 14,
        maxZoomLevel: 14,
        stepZoom: 1.0,
        mapIsLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.place,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.place,
              color: Colors.red,
              size: 60,
            ),
          ),
        ),
        roadConfiguration: const RoadOption(
          roadColor: Colors.yellowAccent,
        ),
        markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 56,
          ),
        )),
        onLocationChanged: (v) {
          provider.getAddressFromLatLong(context, v.latitude, v.longitude);
        },
        onMapIsReady: (isReady) async {
          log(isReady.toString());
          if (isReady) {
            await Future.delayed(const Duration(seconds: 1), () async {
              _mapController.currentLocation();
            });
          }
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
            Text(
              provider.address,
              style: const TextStyle(fontSize: 16),
            ),
            GlobalVariabels.vertical10,
            const Divider(),
            GlobalVariabels.vertical10,
            CommonTextField(
                onChanged: (value) {},
                hint: 'Enter your your address (optional)'),
            GlobalVariabels.vertical15,
            CommonTextField(
                onChanged: (value) {}, hint: 'Work, Home, (optional)'),
            GlobalVariabels.vertical10,
            PrimaryButton(
                onTap: () => provider.setLocation(context),
                label: 'Confirm Location'),
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
