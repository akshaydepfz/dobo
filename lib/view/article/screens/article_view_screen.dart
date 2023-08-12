import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArticleViewScreen extends StatelessWidget {
  const ArticleViewScreen({Key? key, required this.articlHTML})
      : super(key: key);
  final String articlHTML;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        actions: [
          Image.asset(
            AppIcons.shareIcon,
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: HtmlWidget(articlHTML)),
      ),
    );
  }
}
