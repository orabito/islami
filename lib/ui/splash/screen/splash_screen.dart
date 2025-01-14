

import 'package:flutter/material.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'dart:async' ;


class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  static const String routName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    });


  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AssetsManager.splash,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

