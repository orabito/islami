import 'package:flutter/material.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  static const String routeName = "HadithDetailsScreen";

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)!.settings.arguments as HadithModel;

    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: ColorsManager.primary),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            hadithModel.title,
            style: AppTextStyles.headline,
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AssetsManager.leftCorner,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Text(
                          hadithModel.title,
                          style: AppTextStyles.headline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(AssetsManager.rightCorner, fit: BoxFit.cover),
                    ],
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadithModel.text,
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
}
