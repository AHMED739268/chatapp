
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDescriptionText extends StatelessWidget {
  final Animation<Offset> animation;

  const AppDescriptionText({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SlideTransition(
        position: animation,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: const Text(
              "The best chat app for this country",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
