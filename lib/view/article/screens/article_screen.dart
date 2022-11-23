
import 'package:dobo/model/core/assets/app_icons.dart';
import 'package:dobo/model/core/style/app_colors.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(elevation: 0,centerTitle: true,
        backgroundColor:Colors.white,
        title:const Text('Articles'),
        actions: [
          Image.asset(AppIcons.search,
          height: 30,width: 30,),
          const SizedBox(width: 18,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,),
          child: Column(
            children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Trending',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w600
                ),),
                TextButton(
                  onPressed: (){}, 
                  child:const Text('See All',style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.w400
                ),)),
              ],
             ),
              SizedBox(
              height: maxHeight*.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context,RouteConstants.articleViewScreen);
                      },
                      child: Container(width: maxWidth*.52,
                        margin:const EdgeInsets.only(right: 10,left:3,bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                            )
                          ]
                        ),
                        child: Column(children: [
                          ClipRRect(
                            borderRadius:const BorderRadius.vertical(top:Radius.circular(10)),
                            child: Image.network('https://image.cnbcfm.com/api/v1/image/106536818-1589451574987gettyimages-1212106567.jpeg?v=1589451664&w=1600&h=900',
                            height: maxHeight*.18,
                            fit: BoxFit.fill,),
                          ),
                          const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text('COVID-19 Was a top cau se of death in 2022 and gffg gvhgv ytfytvhg gtvtgv',
                            maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w400
                              ),),
                          ),
                        ],),
                      ),
                    );
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Articles',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w600
                ),),
                TextButton(
                  onPressed: (){}, 
                  child:const Text('See All',style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.w400
                ),)),
              ],
             ),
             ListView.builder(
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
               itemCount: 10,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                 margin:const EdgeInsets.only(bottom: 10),
                  padding:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300,
                        blurRadius: 10,
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image:const DecorationImage(fit: BoxFit.cover,
                          image:NetworkImage('https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29yb25hfGVufDB8fDB8fA%3D%3D&w=1000&q=80'))
                      ),
                      height:maxHeight*.13,width: maxWidth*.25,
                     ),
                     const SizedBox(width: 10,),
                     Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: maxWidth*.55,
                          child:const Text('COVID-19 Was a top cau se of death in 2022 and gffg gvhgv ytfytvhg gtvtgv',
                            maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.w500
                              ),),
                        ),
                        SizedBox(width: maxWidth*.5,
                          child:const Divider()),  
                        const Text('Dec 22, 2022',style: TextStyle(color: AppColor.grey3,
                          fontSize: 14,fontWeight: FontWeight.w400
                        ),)
                      ],
                     )
                    ],
                  ),

                 );
               },
             ),
            ],
          ),
        ),
      ),
    );
  }
}