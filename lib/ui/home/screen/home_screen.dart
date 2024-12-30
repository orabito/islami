import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';

import 'package:islami/style/reusable_components/string_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: ColorsManager.navItemBack,
          selectedIndex: 0,
          backgroundColor: ColorsManager.primary,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.quran,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.ahadeth,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.ahadeth,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.ahadith,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.sebha,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.radio,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter:
                    ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.time,
            ),
          ]),
    );
  }
}
