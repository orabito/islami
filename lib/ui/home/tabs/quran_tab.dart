import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/constants.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

import '../widgets/Recently_Surah_Widget.dart';
import '../widgets/sura_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.quranBack),
                fit: BoxFit.fitWidth)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(AssetsManager.lago,height: 151,)),
                TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.searchTextColor,
                      fontFamily: "janna"),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    isCollapsed: true,
                    fillColor: ColorsManager.secondary,
                    hintText: "Enter sura name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsManager.searchTextColor,
                        fontFamily: "janna"),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(AssetsManager.quran),
                    ),
                    prefixIconConstraints:
                    BoxConstraints(maxWidth: 58, maxHeight: 58),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsManager.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsManager.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  StringManager.mostRecently,
                  style: AppTextStyles.subtitle,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(flex: 2,
                  child: ListView.separated(
                     scrollDirection:Axis. horizontal ,
                      itemBuilder: (context, index) => RecentlySurahWidget(),
                      separatorBuilder: (context, index) => SizedBox(width: 10,),
                      itemCount: 10),
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(flex: 4,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          SuraWidget(sura: suraList[index],),
                      itemCount: suraList.length,
                      separatorBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0),
                            child: Divider(height: 20,),
                          ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
