import 'package:fire_base/Components/BuildArticle.dart';
import 'package:fire_base/Getx/MyProvider.dart';
import 'package:fire_base/Server/UrlLancher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class Sports extends StatelessWidget {
  const Sports();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider)=>provider.business==null?Center(
        child: CircularProgressIndicator(color: Colors.orange,),
      ):RefreshIndicator(
        backgroundColor: Colors.orange,
        color: Colors.white,
        onRefresh: ()async{await provider.getSports();},
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: provider.sports.length,
          itemBuilder: (context,index)=>ArticleItem(
            title: provider.sports[index]['title'],
            image: provider.sports[index]['urlToImage'],
            date: provider.sports[index]['publishedAt'],
            function: (){
              Url_Luncher.helper.openWebpage(provider.sports[index]['url']);
            },
          ),
          separatorBuilder: (context,index)=>Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
