

import 'package:flutter/material.dart';
import 'package:islami/style/assets_manager.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'dart:async' as async;


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
    async.Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    });


  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AssetsManager.splash,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
