

import 'package:flutter/material.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/ui/Onboarding/screen/Onboarding_screen.dart';

import 'dart:async' ;


class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  static const String routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
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

