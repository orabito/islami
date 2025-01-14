import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/constants.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

import '../widgets/Recently_Surah_Widget.dart';
import '../widgets/sura_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchValue = "";
  List<SuraModel> suraFilter = [];
  List<SuraModel>mostRecentList=[];

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
                    child: Image.asset(
                      AssetsManager.lago,
                      height: 151,
                    )),
                TextField(
                  onChanged: (value) {
                    searchValue = value;

                    searchSuraWhere(searchValue);
                    setState(() {});
                  },
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
                  height: 20,
                ),
                if (searchValue.isEmpty) ...[
                  Text(
                    StringManager.mostRecently,
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RecentlySurahWidget(
                          suraModel: mostRecentList[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: mostRecentList.length),
                  ),
                  Text(
                    StringManager.suraList,
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
                Expanded(
                    flex: 4,
                    child: ListView.separated(
                      itemBuilder: (context, index) => SuraWidget(
                        addTORecent: () {
                          mostRecentList.insert(0,suraList[index]);
                          setState(() {

                          });
                        },
                        sura: searchValue.isNotEmpty
                            ? suraFilter[index]
                            : suraList[index],
                      ),
                      itemCount: searchValue.isNotEmpty
                          ? suraFilter.length
                          : suraList.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Divider(
                          height: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchSura(String searchText) {
    suraFilter = [];
    for (int i = 0; i < suraList.length; i++) {
      if (suraList[i]
              .suraNameEn
              .toLowerCase()
              .contains(searchText.toLowerCase()) ||
          suraList[i]
              .suraNameAr
              .toLowerCase()
              .contains(searchText.toLowerCase())) {
        suraFilter.add(suraList[i]);
      }
    }
    return;
  }

//thin anther one to search

  void searchSuraWhere(String searchText) {
    suraFilter = [];
    suraFilter = suraList
        .where((element) =>
            element.suraNameEn.toLowerCase().contains(searchText.toLowerCase()) ||
            element.suraNameAr.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  void binarySearch(String searchText) {
    int start = 0;
    int end = suraList.length - 1;
    suraFilter = [];
    while (start <= end) {
      int mid = (start + end) ~/ 2;
      if (suraList[mid].suraNameEn.toLowerCase() == searchText.toLowerCase() ||
          suraList[mid].suraNameAr.toLowerCase() == searchText.toLowerCase()) {
        suraFilter.add(suraList[mid]);

        return;
      } else if (suraList[mid]
                  .suraNameEn
                  .toLowerCase()
                  .compareTo(searchText.toLowerCase()) <
              0 ||
          suraList[mid]
                  .suraNameEn
                  .toLowerCase()
                  .compareTo(searchText.toLowerCase()) <
              0) {
        start = mid + 1;
      } else {
        end = mid - 1;
      }
    }

    return;
  }
}
