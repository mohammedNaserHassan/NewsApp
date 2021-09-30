import 'package:fire_base/Components/BuildArticle.dart';
import 'package:fire_base/Getx/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                     margin: EdgeInsets.all(20),
                      child: TextField(
                          onChanged: (value) {
                            provider.getSearch(value);
                          },
                          decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 3.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3.0),
                              ),
                              labelText: 'Search in news',
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                              border: InputBorder.none),
                          controller: searchController,
                          onSubmitted: (value) {
                            if (value.isEmpty) {
                              return 'Search must not be empty';
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 600.h,
                child: provider.searches.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: provider.searches.length,
                        itemBuilder: (context, index) => ArticleItem(
                          title: provider.searches[index]['title'],
                          image: provider.searches[index]['urlToImage'],
                          date: provider.searches[index]['publishedAt'],
                        ),
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
