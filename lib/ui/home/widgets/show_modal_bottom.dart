import 'package:flutter/material.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';
import 'package:islami/ui/home/widgets/sebha_text_button.dart';

class ShowModalBottom extends StatefulWidget {
  ShowModalBottom(
      {super.key, required this.onNumberSelected, required this.restart});

  final Function(int) onNumberSelected;
  final Function(int) restart;

  @override
  State<ShowModalBottom> createState() => _ShowModalBottomState();
}

class _ShowModalBottomState extends State<ShowModalBottom> {
  int selectedNumber = 11;

  int selectedButtonIndex = -1;

  void _incrementNumber(int index) {
    setState(() {
      selectedNumber += 1;
      selectedButtonIndex = index;
      widget.onNumberSelected(selectedNumber);
    });
  }

  void _selectButton(int index, int number) {
    setState(() {
      selectedNumber = number;
      selectedButtonIndex = index;

      widget.onNumberSelected(selectedNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.primary,
      alignment: Alignment.topCenter,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AssetsManager.ahadethBackground,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AssetsManager.masque,
              color: ColorsManager.secondary,
            ),
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsManager.leftCorner,
                    color: ColorsManager.secondary,
                    width: 80,
                  ),
                  Expanded(
                    child: Text(
                      "اختر عدد مرات التسبيح ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "janna",
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                  ),
                  Image.asset(
                    AssetsManager.rightCorner,
                    color: ColorsManager.secondary,
                    width: 80,
                  ),
                ],
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SebhaTextButton(
                      text: "30",
                      selectedOne: () => _selectButton(0, 31),
                      chooseColor: selectedButtonIndex == 0,
                    ),
                    SebhaTextButton(
                      text: "+ 1",
                      selectedOne: () => _incrementNumber(1),
                      chooseColor: selectedButtonIndex == 1,
                    ),
                    SebhaTextButton(
                      text: "10",
                      selectedOne: () => _selectButton(2, 11),
                      chooseColor: selectedButtonIndex == 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SebhaTextButton(
                        text: "100",
                        selectedOne: () => _selectButton(3, 101),
                        chooseColor: selectedButtonIndex == 3,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          selectedButtonIndex = -1;
                          selectedNumber = 11;
                          print(selectedNumber);
                          widget.onNumberSelected(selectedNumber);
                          widget.restart(0);

                          setState(() {});
                        },
                        iconSize: 30,

                        icon:const  Row(
                          children: [
                            Text("إعادة تعيين",
                              style: TextStyle(
                                  fontFamily: "janna",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30
                              ),),

                             Icon(
                              Icons.loop,
                              color: ColorsManager.secondary,
                            ),
                          ],
                        )
                    ),


                    Expanded(
                      child: SebhaTextButton(
                        text: "50",
                        selectedOne: () => _selectButton(4, 51),
                        chooseColor: selectedButtonIndex == 4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),


        ],
      ),
    );
  }
}
