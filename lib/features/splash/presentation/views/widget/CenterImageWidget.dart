
import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/assetimages.dart';

class CenterImageWidget extends StatelessWidget {
  const CenterImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.splash,
        width: 150,
        height: 150,
      ),
    );
  }
}
