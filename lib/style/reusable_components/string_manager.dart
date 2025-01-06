import 'package:flutter/cupertino.dart';

import 'colors_manager.dart';

class StringManager {
  static const String quran = "Quran";
  static const String ahadith = "Hadith";
  static const String sebha = "Sebha";
  static const String radio = "Radio";
  static const String time = "Time";
  static const String mostRecently = "Most Recently";
}

 abstract final class AppTextStyles {
  static TextStyle headline =const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ColorsManager.primary,
      fontFamily: "janna");
  static TextStyle subtitle  = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ColorsManager.searchTextColor,
      fontFamily: "janna");
  static TextStyle caption   =const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: ColorsManager.searchTextColor,
      fontFamily: "janna");
  static TextStyle caption14   =const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ColorsManager.searchTextColor,
      fontFamily: "janna");
  static TextStyle secondary24   =const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: ColorsManager.secondary,
      fontFamily: "janna");
  static TextStyle secondary14  =const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: ColorsManager.secondary,
      fontFamily: "janna");

}
