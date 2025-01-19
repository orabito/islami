import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';
import 'package:islami/ui/home/widgets/sebha_text_button.dart';
import 'dart:math' as math;
import '../../../style/reusable_components/assets_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turn = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
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
                            "$count",
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
    );
  }

  List<String> azkarSabah = [
    "سبحان الله",
    "الحمد لله ",
    "الله أكبر",
    "أستغفر الله"
  ];

  int count = 0;

  int index = 0;

  azkarSabahCounter() {
    count++;
    if (count == 31) {
      count = 0;
      if (index == azkarSabah.length - 1) {
        index = 0;
      } else {
        index++;
      }
    }
    turn += math.pi / 2;

    setState(() {});
  }
}
