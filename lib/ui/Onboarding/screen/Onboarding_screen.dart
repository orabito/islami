import 'package:flutter/material.dart';
import 'package:islami/models/onboarding_model.dart';
import 'package:islami/style/reusable_components/assets_manager.dart';
import 'package:islami/style/reusable_components/colors_manager.dart';
import 'package:islami/style/reusable_components/string_manager.dart';
import 'package:islami/ui/Onboarding/widget/onboarding_widget.dart';
import 'package:islami/ui/home/screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  static const String routeName = "OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboarding = [
    OnboardingModel(
        image: AssetsManager.pageOne, title: "", text: "Welcome To Islmi App"),
    OnboardingModel(
        image: AssetsManager.pageTwo,
        title: "We Are Very Excited To Have You In Our Community",
        text: "Welcome To Islami"),
    OnboardingModel(
        image: AssetsManager.pageThree,
        title: "Read, and your Lord is the Most Generous",
        text: "Reading the Quran"),
    OnboardingModel(
        image: AssetsManager.pageFour,
        title: "Praise the name of your Lord, the Most High",
        text: "Bearish"),
    OnboardingModel(
        image: AssetsManager.pageFive,
        title:
            "You can listen to the Holy Quran Radio through the application for free and easily",
        text: "Holy Quran Radio"),
  ];

  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      body: SafeArea(
          child: Column(
        children: [
          TextButton(
              onPressed: () {

                // selectedPage=4;
                // setState(() {
                //
                // });if i want to when he tab on skip go
                //to the last on boarding
                //this will be the code
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Skip",
                      style: AppTextStyles.headline,
                    )),
              )),
          Image.asset(
            AssetsManager.lago,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  selectedPage = value;
                  // if(selectedPage==4){
                  //   selectedPage=4;
                  // }and also  this one


                });
              },
              controller: pageController,
              itemCount: onboarding.length,
              itemBuilder: (context, index) {
                return OnboardingWidget(

                  onboardingModel:selectedPage==4?onboarding[4]: onboarding[index],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Back",
                          style: AppTextStyles.headline,
                        )),
                  )),
              Row(
                children: List.generate(
                  onboarding.length,
                  (index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 11.0),
                        child: AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          height: 10,
                          width: selectedPage == index ? 40 : 10,
                          decoration: BoxDecoration(
                              color: selectedPage == index
                                  ? ColorsManager.primary
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                        ));
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    if (selectedPage < onboarding.length - 1) {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 1),
                          curve: Curves.easeInOut);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          selectedPage == 4 ? "Finish" : "Next",
                          style: AppTextStyles.headline,
                        )),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
