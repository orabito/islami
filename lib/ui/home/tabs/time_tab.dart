import 'package:flutter/material.dart';

import '../../../style/reusable_components/assets_manager.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManager.timeBack))
        ),
      );
  }
}
