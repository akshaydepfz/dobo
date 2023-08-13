import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/appointment/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ReviewSummaryScreen extends StatefulWidget {
  final String time;
  final String date;
  final String problem;
  final String doctorID;
  final String name;
  final String gender;
  final String age;

  const ReviewSummaryScreen(
      {super.key,
      required this.time,
      required this.date,
      required this.problem,
      required this.doctorID,
      required this.name,
      required this.gender,
      required this.age});

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> {
  @override
  void initState() {
    Provider.of<BookingService>(context, listen: false)
        .getDoctorDetails(widget.doctorID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingService>(context);
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
                      // EditableTile(
                      //   onTap: () {},
                      //   title: 'Clinic',
                      // ),
                      // GlobalVariabels.vertical15,
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: height * .11,
                      //       width: height * .11,
                      //       decoration: BoxDecoration(
                      //         image: const DecorationImage(
                      //             image: AssetImage(AppAssets.health),
                      //             fit: BoxFit.cover),
                      //         border: Border.all(color: AppColor.grey3),
                      //         borderRadius: BorderRadius.circular(16),
                      //       ),
                      //     ),
                      //     GlobalVariabels.horizontal10,
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: const [
                      //         Text(
                      //           'The family care',
                      //           style: TextStyle(
                      //               fontSize: 16, fontWeight: FontWeight.bold),
                      //         ),
                      //         GlobalVariabels.vertical10,
                      //         IconTextTile(
                      //             name: '+91 2649351476', icon: AppIcons.call),
                      //         GlobalVariabels.vertical10,
                      //         IconTextTile(
                      //             name: 'Malappuram, kerala, india',
                      //             icon: AppIcons.location),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // GlobalVariabels.vertical15,
                      // const Divider(),

                      const Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical15,
                      provider.doctorDetail == null
                          ? const LinearProgressIndicator()
                          : Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: height * .11,
                                  width: height * .11,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.grey3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: provider.doctorDetail!.image == null
                                      ? Image.asset(AppAssets.avatar)
                                      : Image.network(
                                          provider.doctorDetail!.image),
                                ),
                                GlobalVariabels.horizontal10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr.${provider.doctorDetail!.fullName}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GlobalVariabels.vertical10,
                                    IconTextTile(
                                        name:
                                            provider.doctorDetail!.designation,
                                        icon: AppIcons.hospital),
                                    GlobalVariabels.vertical10,
                                    IconTextTile(
                                      name: provider
                                          .doctorDetail!.department.name,
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
                        children: [
                          Text(
                            widget.date,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 2,
                              )),
                          Text(
                            widget.time,
                            style: const TextStyle(fontSize: 16),
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
                      TextTile(title: 'Name', value: widget.name),
                      const Divider(),
                      TextTile(title: 'Gender', value: widget.gender),
                      const Divider(),
                      TextTile(
                          title: 'Age',
                          value:
                              "${DateTime.now().year - int.parse(widget.age)}"),
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Problem :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GlobalVariabels.vertical10,
                      Text(
                        widget.problem,
                      ),
                      GlobalVariabels.vertical10,
                    ],
                  ),
                ),
              ),
            ),
            PrimaryButton(
                isLoading: provider.isLoading,
                onTap: () {
                  provider.addAppointment(
                      context,
                      provider.isPatient
                          ? ''
                          : provider
                              .relatives![provider.selectedRelativeIndex].pk);
                },
                label: 'Book Now')
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
