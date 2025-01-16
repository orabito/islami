import 'package:flutter/material.dart';

import '../../../style/reusable_components/colors_manager.dart';
import '../../../style/reusable_components/string_manager.dart';

class SebhaTextButton extends StatelessWidget {
   SebhaTextButton({super.key,required this.text,required this. selectedOne});
String text;
Function selectedOne;

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: (){
      selectedOne();
    },
      child: Text(text,style: AppTextStyles.subtitle,),style: TextButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))


      ));
  }
}
