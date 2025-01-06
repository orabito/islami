import 'package:flutter/material.dart';

import '../../../style/reusable_components/assets_manager.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(

          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AssetsManager.ahadethBack),fit: BoxFit.fitWidth)
          ),
        ),
      );
  }
}
