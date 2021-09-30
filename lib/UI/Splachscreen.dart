
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:fire_base/UI/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

class SplachScreens extends StatefulWidget {
  const SplachScreens();

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreens>with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 6000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }

  }
  @override
  Widget build(BuildContext context) {
   return SplashScreen.timed(
     seconds: 3,
     route: MaterialPageRoute(builder: (_) => Directionality(
         textDirection: TextDirection.rtl,
         child: Homepage())),
     body: Scaffold(
       body: InkWell(
         child: Center(
           child: CircularRevealAnimation(
               minRadius: 12,
               animation: animation,
               maxRadius: 1000,
               child: Image.asset('images/splash.png')),
         ),
       ),
     ),
   );
  }
}
