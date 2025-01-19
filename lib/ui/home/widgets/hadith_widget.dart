import 'package:flutter/material.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/ui/hadith%20Details/screen/hadith_details_screen.dart';

import '../../../style/reusable_components/assets_manager.dart';
import '../../../style/reusable_components/string_manager.dart';

class HadithWidget extends StatelessWidget {
  HadithWidget({super.key, required this.hadithModel});

  HadithModel hadithModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HadithDetailsScreen.routeName,
            arguments: hadithModel);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsManager.primary),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AssetsManager.leftCorner,
                    color: ColorsManager.secondary,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    hadithModel.title,
                    style: const TextStyle(
                        fontFamily: "janna",
                        fontSize: 17,
                        color: ColorsManager.secondary,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AssetsManager.rightCorner,
                    color: ColorsManager.secondary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(alignment: Alignment.center, children: [
                Image.asset(AssetsManager.ahadethBackground),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    hadithModel.text,
                    style: AppTextStyles.secondary14,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]),
            ),
            Image.asset(
              AssetsManager.masque,
              width: double.infinity,
              fit: BoxFit.cover,
              color: ColorsManager.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
