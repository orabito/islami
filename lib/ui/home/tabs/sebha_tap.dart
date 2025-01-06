import 'package:flutter/material.dart';

import '../../../style/reusable_components/assets_manager.dart';

class SebhaTap extends StatelessWidget {
  const SebhaTap({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManager.sebhaBack))
        ),
      );
  }
}
