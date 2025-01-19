import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/style/prefHelper.dart';
import 'package:islami/ui/Onboarding/screen/Onboarding_screen.dart';
import 'package:islami/ui/hadith%20Details/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/splash/screen/splash_screen.dart';
import 'package:islami/ui/sura%20details/sura_details.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
 await prefhelper.init();
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
     debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName:(_)=>const HomeScreen(),
        SuraDetails.routeName:(_)=>const SuraDetails(),
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
        HadithDetailsScreen.routeName:(_)=>const HadithDetailsScreen()

      },
      initialRoute: SplashScreen.routeName,

    );
  }
}
