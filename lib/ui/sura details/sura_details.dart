import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraText = "";

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraText.isEmpty) {
      loadFile(suraModel.suraNumber.toString());
    }
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: ColorsManager.primary),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            suraModel.suraNameEn,
            style: AppTextStyles.headline,
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(
                        suraModel.suraNameAr,
                        style: AppTextStyles.headline,
                      ),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Expanded(
                    child: suraText.isEmpty
                        ?const Center(
                            child: CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ))
                        : SingleChildScrollView(
                            child: Text(
                              suraText,
                              style: AppTextStyles.headline20,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AssetsManager.masque,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  loadFile(suraNumber) async {
    suraText = await rootBundle.loadString("assets/files/$suraNumber.txt");
    List<String> lines = suraText.split("\n");
    String temp = "";
    for (int i = 0; i < lines.length; i++) {
      temp += lines[i].trim();
      temp += "【${i + 1}】";
    }

    suraText = temp;
    setState(() {});
  }
}
