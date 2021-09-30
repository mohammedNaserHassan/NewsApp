import 'package:fire_base/Components/Themes.dart';
import 'package:fire_base/Server/dio_helper.dart';
import 'package:fire_base/UI/Splachscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'Getx/MyProvider.dart';
import 'Getx/getStorage.dart';
import 'UI/Homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Dio_helper.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(392.72, 834.9),
        builder: () => GetBuilder<MyProvider>(
          init: MyProvider(),
          builder:(provider)=> GetMaterialApp(
            theme: ThemeStorage().getThemeMode(),
            debugShowCheckedModeBanner: false,
            home: SplachScreens()
          ),
        ),
    );
  }
}
