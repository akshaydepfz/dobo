import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrimaryAppbar(title: 'Write a Review'),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xffBFBDBE)),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AppAssets.doctor2))),
                ),
                const Text(
                  'How was your experience\nwith Dr. Rubayet Sakib?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RatingBar.builder(
                    glow: false,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rounded,
                      color: AppColor.primary,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const Divider(),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Write Your Review',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.grey1,
                  ),
                  child: const TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your review here...'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteConstants.reviewPop);
                    },
                    label: 'Submit'),
                SecondaryButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    label: 'Cancel'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
