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

class _SplashViewState extends State<SplashView>  with TickerProviderStateMixin {

  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<Offset> _whatsTextAnimation;
  late Animation<Offset> _appTextAnimation;

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );


    _whatsTextAnimation = Tween<Offset>(
      begin: Offset(0, 2), // Start from below the screen
      end: Offset(0, 0),   // Move to its final position (under the image)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _appTextAnimation = Tween<Offset>(
      begin: Offset(0, 2), // Start from off-screen (right)
      end: Offset(0, 0),   // Move next to "Whats"
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    _controller.forward();
    _controller2.forward();

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
    _controller2.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              Assets.splash
             , width: 150,
               height: 150,
            ),
          ),

          Positioned.fill(
            child: SlideTransition(
              position: _whatsTextAnimation,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0,), // Adjust position below the image
                  child: Text(
                    "WhatsUp",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                  padding: const EdgeInsets.only(top: 300.0 ), // Adjust to align with "Whats"
                  child: Text(
                    "The best chat app for this country ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
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
