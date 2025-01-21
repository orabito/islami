import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';

import '../../../style/reusable_components/colors_manager.dart';


class SebhaTextButton extends StatefulWidget {
  SebhaTextButton({super.key,required this.chooseColor, required this.text, required this.selectedOne});

  String text;
  VoidCallback selectedOne;
  late bool chooseColor;



  @override
  State<SebhaTextButton> createState() => _SebhaTextButtonState();
}

class _SebhaTextButtonState extends State<SebhaTextButton> {


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          widget.selectedOne();
         setState(() {
           widget.chooseColor=!widget.chooseColor;
         });
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
        ),

          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.suraNumber,
                colorFilter:widget.chooseColor==true?
                ColorFilter.mode(Colors.black, BlendMode.srcIn):
                ColorFilter.mode(Colors.white, BlendMode.srcIn),

                width: 95,
                height: 80,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "janna",
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.secondary),
              ),
            ],
          ),
        );
  }
}
