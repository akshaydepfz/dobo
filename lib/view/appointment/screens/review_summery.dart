import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PrimaryAppbar(title: 'Review Summary'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditableTile(
                        onTap: () {},
                        title: 'Clinic',
                      ),
                      GlobalVariabels.vertical15,
                      Row(
                        children: [
                          Container(
                            height: height * .11,
                            width: height * .11,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.health),
                                  fit: BoxFit.cover),
                              border: Border.all(color: AppColor.grey3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          GlobalVariabels.horizontal10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'The family care',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: '+91 2649351476', icon: AppIcons.call),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: 'Malappuram, kerala, india',
                                  icon: AppIcons.location),
                            ],
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical15,
                      const Divider(),
                      GlobalVariabels.vertical15,
                      const Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      Row(
                        children: [
                          Container(
                            height: height * .11,
                            width: height * .11,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.doctor2),
                                  fit: BoxFit.cover),
                              border: Border.all(color: AppColor.grey3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          GlobalVariabels.horizontal10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Dr. Rubayet Sakib',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                  name: 'The family care',
                                  icon: AppIcons.hospital),
                              GlobalVariabels.vertical10,
                              IconTextTile(
                                name: 'Dental Specialist',
                                icon: AppIcons.medal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      EditableTile(
                        onTap: () {},
                        title: 'Date & Time',
                      ),
                      Row(
                        children: const [
                          Text(
                            'March 15, 2022',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 2,
                              )),
                          Text(
                            '09:00 AM',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      EditableTile(
                        onTap: () {},
                        title: 'Patient Details',
                      ),
                      GlobalVariabels.vertical10,
                      const TextTile(title: 'Name', value: 'Rubayet Sakib'),
                      const Divider(),
                      const TextTile(title: 'Gender', value: 'Male'),
                      const Divider(),
                      const TextTile(title: 'Age', value: '24'),
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Problem :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GlobalVariabels.vertical10,
                      const Text(
                        'The family care is oneof the to are pmost to health care providers , India. Our hos pital’s are renowned for to their medical infras the tructure...',
                        style: TextStyle(),
                      ),
                      GlobalVariabels.vertical10,
                    ],
                  ),
                ),
              ),
            ),
            PrimaryButton(onTap: () {
              Navigator.pushNamed(context, RouteConstants.bookingFailPop);
            }, label: 'Book Now')
          ],
        ),
      ),
    );
  }
}

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          GlobalVariabels.horizontal10,
          const Text(
            ':',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          GlobalVariabels.horizontal10,
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class EditableTile extends StatelessWidget {
  const EditableTile({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        EditButton(
          onTap: onTap,
        ),
      ],
    );
  }
}

class IconTextTile extends StatelessWidget {
  const IconTextTile({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 20, child: SvgPicture.asset(icon)),
        GlobalVariabels.horizontal10,
        Text(name)
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 20, width: 20, child: SvgPicture.asset(AppIcons.edit)),
    );
  }
}
