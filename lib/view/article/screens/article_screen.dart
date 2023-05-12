import 'package:dobo/common/common_loading.dart';
import 'package:dobo/core/assets/app_icons.dart';
import 'package:dobo/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/article/services/article_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    Provider.of<ArticleService>(context, listen: false).getArticles();
    Provider.of<ArticleService>(context, listen: false).getTrendingArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<ArticleService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Articles'),
        actions: [
          Image.asset(
            AppIcons.search,
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
      body: provider.articleList == null
          ? const CommonLoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    provider.trendingList == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: maxHeight * .28,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.trendingList!.length,
                              itemBuilder: (BuildContext context, i) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RouteConstants.articleViewScreen);
                                  },
                                  child: TrendingArticleCard(
                                      date: provider.trendingList![i].date
                                          .toString(),
                                      image: provider.trendingList![i].image,
                                      title: provider.trendingList![i].title,
                                      maxWidth: maxWidth,
                                      maxHeight: maxHeight),
                                );
                              },
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Articles',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.articleList!.length,
                      itemBuilder: (BuildContext context, i) {
                        return ArticleCard(
                            date: provider.articleList![i].date.toString(),
                            image: provider.articleList![i].image,
                            title: provider.articleList![i].title,
                            maxHeight: maxHeight,
                            maxWidth: maxWidth);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class TrendingArticleCard extends StatelessWidget {
  const TrendingArticleCard({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.image,
    required this.title,
    required this.date,
  });

  final double maxWidth;
  final double maxHeight;
  final String image;
  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth * .52,
      margin: const EdgeInsets.only(right: 10, left: 3, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            )
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              image,
              height: maxHeight * .18,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.image,
    required this.title,
    required this.date,
  });

  final double maxHeight;
  final double maxWidth;
  final String image;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image))),
            height: maxHeight * .13,
            width: maxWidth * .25,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: maxWidth * .55,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: maxWidth * .5, child: const Divider()),
              Text(
                date,
                style: const TextStyle(
                    color: AppColor.grey3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
