import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fire_base/Getx/MyProvider.dart';
import 'package:fire_base/Getx/getStorage.dart';
import 'package:fire_base/Taps/Business.dart';
import 'package:fire_base/Taps/Scince.dart';
import 'package:fire_base/Taps/Sports.dart';
import 'package:fire_base/UI/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Homepage extends StatefulWidget {
  const Homepage();

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //Getx.of<MyProvider>(context, listen: false).pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (provider) => Scaffold(
        appBar: AppBar(
          title: Text('تطبيق أخبار'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.to(SearchScreen());
              },
            ),
            IconButton(
              icon: Icon(Icons.brightness_4_rounded),
              onPressed: () {
                ThemeStorage().changeThemeMode();
              },
            ),
          ],
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: provider.pageController,
            onPageChanged: (index) {
              provider.MoveAndAnimate(index);
            },
            children: <Widget>[Business(), Sports(), Scince()],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Theme.of(context).canvasColor,
          selectedIndex: provider.selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => provider.MoveAndAnimate(index),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.business),
              title: Text('الأعمال'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.sports),
                title: Text('الرياضة'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.science),
                title: Text('العلوم'),
                activeColor: Colors.pink),

          ],
        ),
      ),
    );
  }
}
