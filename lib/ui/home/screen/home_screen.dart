import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';

import 'package:islami/style/reusable_components/string_manager.dart';
import 'package:islami/ui/home/tabs/hadith_tab.dart';
import 'package:islami/ui/home/tabs/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio_tap.dart';
import 'package:islami/ui/home/tabs/sebha_tap.dart';
import 'package:islami/ui/home/tabs/time_tap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexSel = 0;
 final List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTap(),
    const RadioTap(),
    const TimeTap()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.secondary.withValues(alpha: .6),
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: ColorsManager.navItemBack,
          selectedIndex: indexSel,
          backgroundColor: ColorsManager.primary,
          onDestinationSelected: (index) {
            setState(() {
              indexSel = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter:
                    const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.quran,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.ahadeth,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.ahadeth,
                colorFilter:
                    const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.ahadith,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter:
                    const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.sebha,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter:
                    const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.radio,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter:
                    const ColorFilter.mode(ColorsManager.primary, BlendMode.srcIn),
              ),
              label: StringManager.time,
            ),
          ]),
      body: tabs[indexSel],
    );
  }
}
