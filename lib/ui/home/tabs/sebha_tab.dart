import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/prefHelper.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/ui/home/widgets/show_modal_bottom.dart';

import 'dart:math' as math;
import '../../../style/reusable_components/assets_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turn = 0;
  int selected = 11;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = prefhelper.getIndexsebha();
    counter = prefhelper.getCountersebha();
    selected= prefhelper.getSelectedsebha();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsManager.primary,
          onPressed: () {
            showModalBottoms();
          },
          child: Icon(
            Icons.menu,
            color: ColorsManager.secondary,
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    AssetsManager.lago,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "janna",
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.tertiary),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      AssetsManager.sebhaTop,
                      height: MediaQuery.of(context).size.height * .1,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: InkWell(
                        onTap: () {
                          azkarSabahCounter();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: turn,
                              transformHitTests: true,
                              child: SvgPicture.asset(
                                AssetsManager.sebhaNumber,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * .9,
                              ),
                            ),
                            Text(
                              azkarSabah[index],
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontFamily: "janna",
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManager.tertiary),
                            ),
                            Positioned(
                              bottom: 75,
                              child: Text(
                                "$counter",
                                style: const TextStyle(
                                    fontSize: 36,
                                    fontFamily: "janna",
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.tertiary),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showModalBottoms() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ShowModalBottom(
        restart: (restartNumber) {
          index = restartNumber;
          prefhelper.setIndexSebha(index);
          counter = 0;
          prefhelper.setCounterSebha(counter);
          setState(() {});
        },
        onNumberSelected: (int number) {
          selected = number;
          prefhelper.setSelectedSebha(selected);
          setState(() {});
          print(selected);
        },
      ),
    );
  }

  List<String> azkarSabah = [
    "سبحان الله",
    "الحمد لله ",
    "الله أكبر",
    "أستغفر الله"
  ];

  int counter = 0;

  int index = 0;

  azkarSabahCounter() {
    counter++;


    if (counter == selected) {
      counter = 0;

      if (index == azkarSabah.length - 1) {
        index = 0;

      } else {
        index++;

      }


    }
    prefhelper.setIndexSebha(index);
    prefhelper.setCounterSebha(counter);
    turn += math.pi / 2;

    setState(() {});
  }
}
