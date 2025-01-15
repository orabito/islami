import 'package:flutter/material.dart';
import 'package:islami/models/onboarding_model.dart';

import 'package:islami/style/reusable_components/string_manager.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget(
      {super.key,
      required,
      required this.onboardingModel,
  });

  OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              onboardingModel.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
              child: Text(
            onboardingModel.text,
            style: AppTextStyles.headline,

          )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 2,
              child: Text(
                onboardingModel.title,
                style: AppTextStyles.headline20,
              )),
        ],
      ),
    );
  }
}
