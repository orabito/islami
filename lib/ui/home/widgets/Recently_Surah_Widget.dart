import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

import '../../sura details/sura_details.dart';

class RecentlySurahWidget extends StatelessWidget {
   RecentlySurahWidget({required this.suraModel});
SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:()=>Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: suraModel) ,
      child: Container(
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
                  Text(suraModel.suraNameEn,style: AppTextStyles.secondary24,),
                  Text(suraModel.suraNameAr,style: AppTextStyles.secondary24,),
                  Text("${suraModel.versesNumber} verses",style: AppTextStyles.secondary14,)
                ],
              ),
            ),
            Image.asset(AssetsManager.quranCard,fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}
