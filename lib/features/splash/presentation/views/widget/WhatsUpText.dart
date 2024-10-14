import 'package:flutter/material.dart';

import '../../../../../core/themes/colors.dart';

class WhatsUpText extends StatelessWidget {
  final Animation<Offset> animation;

   WhatsUpText({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SlideTransition(
        position: animation,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.only(top: 200.0),
            child:  Text(
              "WhatsUp",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ),
    );
  }
}

