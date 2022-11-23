import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class ArticleViewScreen extends StatelessWidget {
  const ArticleViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,centerTitle: true,
        backgroundColor:Colors.white,
        actions: [
          Image.asset(AppIcons.shareIcon,
          height: 30,width: 30,),
          const SizedBox(width: 18,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin:const EdgeInsets.only(bottom: 20),
              height: maxHeight*.3,width:maxWidth,
              decoration:const BoxDecoration(
                image: DecorationImage(fit: BoxFit.fill,
                  image:NetworkImage('https://image.cnbcfm.com/api/v1/image/106536818-1589451574987gettyimages-1212106567.jpeg?v=1589451664&w=1600&h=900')),
              ),
              ),
              const Text('COVID-19 Was a top cause of death in 2022 and 2021, even for younger people',style: TextStyle(
                  fontSize:20,fontWeight: FontWeight.w600
                  ),),
               const Padding(
                 padding:EdgeInsets.symmetric(vertical: 12),
                 child: Text('Dec 22, 2022',style: TextStyle(color: AppColor.grey3,
                      fontSize: 14,fontWeight: FontWeight.w400
                    ),),
               ),
               const Divider(),
               const SizedBox(height: 12,),
               const Text('In late December 2019, an outbreak of a mysterious pneumonia characterized by fever, dry cough, and fatigue, and occasional gastrointestinal symptoms happened in a seafood wholesale wet market, the Huanan Seafood Wholesale Market, in Wuhan, Hubei, China.1 The initial outbreak was reported in the market in December 2019 and involved about 66% of the staff there. The market was shut down on January 1, 2020, after the announcement of an epidemiologic alert by the local health authority on December 31, 2019. However, in the following month (January) thousands of people in China, including many provinces (such as Hubei, Zhejiang, Guangdong, Henan, Hunan, etc.) and cities (Beijing and Shanghai) were attacked by the rampant spreading of the disease.2 Furthermore, the disease traveled to other countries, such as Thailand, Japan, Republic of Korea, Viet Nam, Germany, United States, and Singapore. The first case reported in our country was on January 21, 2019. As of February 6, 2020, a total of 28,276 confirmed cases with 565 deaths globally were documented by WHO, involving at least 25 countries.3 The pathogen of the outbreak was later identified as a novel beta-coronavirus, named 2019 novel coronavirus (2019-nCoV) and recalled to our mind the terrible memory of the severe acute respiratory syndrome (SARS-2003, caused by another beta-coronavirus) that occurred 17 years ago',style: TextStyle(color: AppColor.grey4,
                fontSize: 14,fontWeight: FontWeight.w400,
               ),)      
            ],
          ),
        ),
      ),
    );
  }
}