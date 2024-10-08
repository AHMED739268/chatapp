import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../auth/presentation/views/Loginin_View.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _whatsTextAnimation;
  late Animation<Offset> _appTextAnimation;

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _whatsTextAnimation = Tween<Offset>(
      begin: Offset(0, 2), // Start from below the screen
      end: Offset(0, 0),   // Move to its final position (under the image)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _appTextAnimation = Tween<Offset>(
      begin: Offset(2, 0), // Start from off-screen (right)
      end: Offset(0, 0),   // Move next to "Whats"
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogininView()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.splash
             , width: 70,
               height: 70,
            ),
          ),

          Positioned.fill(
            child: SlideTransition(
              position: _whatsTextAnimation,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0,left: 140), // Adjust position below the image
                  child: Text(
                    "Whats",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: SlideTransition(
              position: _appTextAnimation,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0, left: 150,right: 45), // Adjust to align with "Whats"
                  child: Text(
                    "App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
