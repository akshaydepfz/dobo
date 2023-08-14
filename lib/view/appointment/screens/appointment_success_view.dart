import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/common/primary_button.dart';
import 'package:dobo/common/secondary_button.dart';
import 'package:dobo/constants/global_variables.dart';
import 'package:dobo/core/assets/app_assets.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/appointment/screens/review_summery.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/my_appointments/services/appointment_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentSuccessView extends StatefulWidget {
  const AppointmentSuccessView(
      {super.key,
      required this.doctorId,
      required this.clinicId,
      required this.date,
      required this.time,
      required this.tokenNo,
      required this.name,
      required this.gender,
      required this.age,
      required this.problem});
  final String doctorId;
  final String clinicId;
  final DateTime date;
  final String time;
  final String tokenNo;
  final String name;
  final String gender;
  final DateTime age;
  final String problem;
  @override
  State<AppointmentSuccessView> createState() => _AppointmentSuccessViewState();
}

class _AppointmentSuccessViewState extends State<AppointmentSuccessView> {
  @override
  void initState() {
    Provider.of<AppointmentService>(context, listen: false)
        .getClinicDetails(widget.clinicId);
    Provider.of<AppointmentService>(context, listen: false)
        .getDoctorDetails(widget.doctorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentService>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LandingScreen()));
            },
            icon: const Icon(Icons.close)),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Appointment Details'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   const PrimaryAppbar(title: 'My Appointment'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clinic',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      provider.clinicDetail == null
                          ? SizedBox()
                          : Row(
                              children: [
                                Container(
                                  height: height * .10,
                                  width: height * .10,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.grey3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: provider.clinicDetail!.image == ''
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(AppAssets.avatar),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            provider.clinicDetail!.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                GlobalVariabels.horizontal10,
                                provider.clinicDetail == null
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.clinicDetail!.clinicName,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GlobalVariabels.vertical10,
                                          IconTextTile(
                                              name:
                                                  provider.clinicDetail!.phone,
                                              icon: AppIcons.call),
                                          GlobalVariabels.vertical10,
                                          IconTextTile(
                                              name: provider.clinicDetail!.city,
                                              icon: AppIcons.location),
                                        ],
                                      ),
                              ],
                            ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      provider.doctorDetail == null
                          ? const SizedBox()
                          : Row(
                              children: [
                                Container(
                                  height: height * .10,
                                  width: height * .10,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.grey3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: provider.doctorDetail!.image == null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(AppAssets.avatar),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            provider.doctorDetail!.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                GlobalVariabels.horizontal10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. ${provider.doctorDetail!.fullName}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GlobalVariabels.vertical10,
                                    IconTextTile(
                                        name: provider.clinicDetail == null
                                            ? ""
                                            : provider.clinicDetail!.clinicName,
                                        icon: AppIcons.hospital),
                                    GlobalVariabels.vertical10,
                                    IconTextTile(
                                      name: provider
                                          .doctorDetail!.department.category,
                                      icon: AppIcons.medal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date & Time',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GlobalVariabels.vertical10,
                              Row(
                                children: [
                                  Text(
                                    "${widget.date.day}-${widget.date.month}-${widget.date.year}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    widget.time,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      Row(
                        children: [
                          const Text(
                            'Token No : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.tokenNo,
                            style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      GlobalVariabels.vertical10,
                      const Divider(),
                      GlobalVariabels.vertical10,
                      const Text(
                        'Patient Details',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlobalVariabels.vertical10,
                      TextTile(title: 'Name', value: widget.name),
                      const Divider(),
                      TextTile(title: 'Gender', value: widget.gender),
                      const Divider(),
                      TextTile(
                          title: 'Age',
                          value:
                              "${DateTime.now().year - int.parse(widget.age.year.toString())}"),
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
                        style: const TextStyle(),
                      ),
                      GlobalVariabels.vertical10,
                      PrimaryButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.resceduleAppointment);
                          },
                          label: 'Reschedule'),
                      SecondaryButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.cancelAppointment);
                          },
                          label: 'Cancel')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}