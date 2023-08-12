import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/view/profile/services/profile_services.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class HelpCentreScren extends StatefulWidget {
  const HelpCentreScren({super.key});

  @override
  State<HelpCentreScren> createState() => _HelpCentreScrenState();
}

class _HelpCentreScrenState extends State<HelpCentreScren> {
  @override
  void initState() {
    Provider.of<ProfileService>(context, listen: false).getHelpcenterHTML();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Help Center'),
     backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: provider.helpCenterHTML == null
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : HtmlWidget(provider.helpCenterHTML!),
        ),
      ),
    );
  }
}
