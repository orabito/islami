import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/splash/screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routName: (_) => SplashScreen(),
        HomeScreen.routName:(_)=>HomeScreen(),

      },
      initialRoute: SplashScreen.routName,

    );
  }
}
