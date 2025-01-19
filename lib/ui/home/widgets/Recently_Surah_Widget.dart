import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';

import '../../sura details/sura_details.dart';

class RecentlySurahWidget extends StatelessWidget {
   RecentlySurahWidget({super.key, required this.suraModel,required this.addFomeRecent});
SuraModel suraModel;

  void Function() addFomeRecent ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
        addFomeRecent();

        Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: suraModel);
      } ,
      child: Container(
        padding: const EdgeInsets.all(7),

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
                  Text(suraModel.suraNameEn,style:
                  const TextStyle(
                      color: ColorsManager.secondary,
                      fontSize: 20,
                      fontFamily: "janna",
                      fontWeight: FontWeight.w700
                  ),),
                  Text(suraModel.suraNameAr,style:
                  const TextStyle(
                      color: ColorsManager.secondary,
                      fontSize: 20,
                      fontFamily: "janna",
                      fontWeight: FontWeight.w700
                  ),),
                  Text("${suraModel.versesNumber} verses",style:
                  const TextStyle(
                    color: ColorsManager.secondary,
                    fontSize: 14,
                    fontFamily: "janna",
                    fontWeight: FontWeight.w700
                  ),)
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
