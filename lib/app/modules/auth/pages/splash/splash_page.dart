import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:taski_app/app/core/routes/route_manager.dart';
import 'package:taski_app/resources/resources.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({super.key, this.title = 'SplashPage'});
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          width: 40.w,
          fit: BoxFit.contain,
        ).animate(
            onComplete: (controller) {
              RouteManager.goToHome();
            },
            effects: [
              FadeEffect(
                duration: 1000.ms,
                curve: Curves.easeInOut,
              ),
              MoveEffect(
                begin: Offset(0, 100),
                duration: 1000.ms,
                curve: Curves.easeInOut,
              ),
            ]),
      ),
    );
  }
}
