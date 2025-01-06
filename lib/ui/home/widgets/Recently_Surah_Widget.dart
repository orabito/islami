import 'package:flutter/material.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

class RecentlySurahWidget extends StatelessWidget {
  const RecentlySurahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.primary
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("al- anbyaa",style: AppTextStyles.secondary24,),
                Text("الانبياء",style: AppTextStyles.secondary24,),
                Text("112 verses",style: AppTextStyles.secondary14,)
              ],
            ),
          ),
          Image.asset(AssetsManager.quranCard)
        ],
      ),
    );
  }
}
