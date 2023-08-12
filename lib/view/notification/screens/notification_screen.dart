import 'package:dobo/common/common_loading.dart';
import 'package:dobo/common/primary_appbar.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/notification/services/notification_service.dart';
import 'package:dobo/view/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<NotificationService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
       backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            provider.notificationList == null
                ? const CommonLoadingWidget()
                : provider.notificationList!.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: height / 3),
                        child: const Center(
                          child: Text('No notifications found'),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: provider.notificationList!.length,
                            itemBuilder: (context, i) {
                              return NotificationCard(
                                onTap: () {},
                                isWrong: false,
                                title: provider.notificationList![i].title,
                                msg: provider.notificationList![i].description,
                                time: provider.notificationList![i].created
                                    .toString(),
                              );
                            }),
                      )
          ],
        ),
      ),
    );
  }
}
