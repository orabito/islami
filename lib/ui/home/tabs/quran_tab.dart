import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/constants.dart';
import 'package:islami/style/prefHelper.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

import '../widgets/Recently_Surah_Widget.dart';
import '../widgets/sura_widget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchValue = "";
  List<SuraModel> suraFilter = [];
  List<SuraModel>mostRecentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecentList = prefhelper.getRecentList();
    removeDuplicates();
  }

  void removeDuplicates() {
    mostRecentList = LinkedHashSet<SuraModel>.from(mostRecentList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.quranBack),
                fit: BoxFit.fitWidth)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 4,
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsManager.lago,

                        fit: BoxFit.cover,
                      )),
                ),
                TextField(
                  onChanged: (value) {
                    searchValue = value;

                    searchSuraWhere(searchValue);
                    setState(() {});
                  },
                  style: const TextStyle(
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
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsManager.searchTextColor,
                        fontFamily: "janna"),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(AssetsManager.quran),
                    ),
                    prefixIconConstraints:
                    const BoxConstraints(maxWidth: 58, maxHeight: 58),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: ColorsManager.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: ColorsManager.primary),
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
                  const SizedBox(
                    height: 10,
                  ),
                  if(mostRecentList.isNotEmpty) ...[Expanded(
                    flex: 4,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            RecentlySurahWidget(
                              addFomeRecent: () {
                                mostRecentList.insert(0,mostRecentList[index]);
                                removeDuplicates();
                                setState(() {
                                  prefhelper.addRecentList(mostRecentList);


                                });
                              },
                              suraModel: mostRecentList[index],
                            ),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          width: 10,
                        ),
                        itemCount: min(10,mostRecentList.length),
                  ))
                  ],
                  Text(
                    StringManager.suraList,
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
                Expanded(
                    flex: 7,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          SuraWidget(
                            addTORecent: () {
                              // for (int i = 0; i < mostRecentList.length; i++) {
                              //   if (mostRecentList[i].suraNameEn ==
                              //       (searchValue.isNotEmpty
                              //           ? suraFilter[index].suraNameEn
                              //           : suraList[index].suraNameEn)) {
                              //     mostRecentList.removeAt(i);
                              //   }
                              // }
                              //to make recently list don't be repetition
                              //like what i do in set

                              mostRecentList.insert(0,
                                  searchValue.isNotEmpty ? suraFilter[index]
                                      : suraList[index]);
                              removeDuplicates();
                              setState(() {
                                prefhelper.addRecentList(mostRecentList);
                              });
                            },
                            sura: searchValue.isNotEmpty
                                ? suraFilter[index]
                                : suraList[index],
                          ),
                      itemCount: searchValue.isNotEmpty
                          ? suraFilter.length
                          : suraList.length,
                      separatorBuilder: (context, index) =>
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
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
