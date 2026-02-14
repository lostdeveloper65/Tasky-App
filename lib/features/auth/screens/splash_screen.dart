import 'package:flutter/material.dart';
import 'package:taskyapp/core/constants/assets_class.dart';
import 'package:animate_do/animate_do.dart';
import 'package:taskyapp/features/auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 900),
              // animate: true,
              child: Image.asset(AssetsConstants.taskIcon),
            ),
            BounceInDown(
              duration: Duration(milliseconds: 900),
              delay: Duration(milliseconds: 600),
              from: 50,
              child: Image.asset(AssetsConstants.yIcon),
            ),
          ],
        ),
      ),
    );
  }
}
