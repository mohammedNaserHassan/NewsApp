import 'package:fire_base/Components/Themes.dart';
import 'package:fire_base/Server/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getStorage.dart';

class MyProvider extends GetxController {
  @override
  void onInit() {
    pageController = PageController();
    getBusiness();
    getSceince();
    getSports();
  }

  PageController pageController;
  int selectedIndex = 0;

  MoveAndAnimate(int value) {
    this.selectedIndex = value;
    pageController.animateToPage(value,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
    update();
  }

///////////////Business/////////////////
  List<dynamic> business = [];

  void getBusiness() async {
    await Dio_helper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '864302f611414f94a5741a44b44b6fe2',
    }).then((value) {
      business = value.data['articles'];
    });
  }

  ///////////////Sports//////////////
  List<dynamic> sports = [];

  void getSports() async {
    await Dio_helper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '864302f611414f94a5741a44b44b6fe2',
    }).then((value) {
      sports = value.data['articles'];
    });
  }

  ///////////////Science//////////////
  List<dynamic> science = [];

  void getSceince() async {
    await Dio_helper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '864302f611414f94a5741a44b44b6fe2',
    }).then((value) {
      science = value.data['articles'];
    });
  }

  //////Search////////
List<dynamic> searches=[];
  void getSearch(String value)async{
    await Dio_helper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '864302f611414f94a5741a44b44b6fe2',
    }).then((value) {
      searches = value.data['articles'];
    });
  }
}
