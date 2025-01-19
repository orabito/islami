
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/ui/home/widgets/hadith_widget.dart';

import '../../../style/reusable_components/assets_manager.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  PageController controller = PageController(
    viewportFraction: .8,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (hadithList.isEmpty) {
          loadFileHadith();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.ahadethBack),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManager.lago,
                    height: 151,
                  )),
              const SizedBox(
                height: 55,
              ),
              hadithList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ColorsManager.primary,
                    ))
                  : Expanded(
                      child: CarouselSlider.builder(
                        itemCount: hadithList.length,
                        itemBuilder: (context, index, realIndex) =>
                            HadithWidget(hadithModel: hadithList[index]),
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.width * 10,
                          enableInfiniteScroll: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          pageSnapping: true,
                          animateToClosest: true,
                          viewportFraction: .76,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                        ),
                      ),

                      // PageView.builder(
                      //   padEnds: false,
                      //   controller: controller,
                      //   itemBuilder: (context, index) => HadithWidget(
                      //     hadithModel: hadithList[index% hadithList.length],
                      //   ),
                      //   itemCount: hadithList.length,
                      // ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<HadithModel> hadithList = [];

  loadFileHadith() async {

    for (int i = 1; i <= 50; i++) {
      String hadith = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      List<String> lines = hadith.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String text = lines.join();
      hadithList.add(HadithModel(text: text, title: title));
    }
    setState(() {});
  }

  //if the ahadith from one file we will use this function
loadHadithFromOneFile ()async{

    String text =  await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> tempAhadeth = text.split("#");
    for(int i=0;i<tempAhadeth.length;i++){
      List<String> hadethLines = tempAhadeth[i].trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join(" ");
      hadithList.add(HadithModel(title: title, text: content));
    }
    setState(() {

    });

}
}
