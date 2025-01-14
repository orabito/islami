
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';
import 'package:islami/ui/sura%20details/sura_details.dart';
typedef AddToRecent = void Function();
class SuraWidget extends StatelessWidget {
   SuraWidget({required this.sura,required this.addTORecent});
SuraModel sura;
   AddToRecent addTORecent ;
   @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          //add to most recent
          addTORecent();
          Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: sura);
        },
        child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
        
              SvgPicture.asset(AssetsManager.suraNumber,width: 80,height: 70,
              ),
              Text("${sura.suraNumber}",style: AppTextStyles.caption,)
            ],
        
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${sura.suraNameEn}",style: AppTextStyles.caption,),
                Text("${sura.versesNumber} verses",style: AppTextStyles.caption14 ,)
              ],
            ),
          ),
          Text("${sura.suraNameAr}",style: AppTextStyles.caption,)
        ],
            ),
      );
  }
}
