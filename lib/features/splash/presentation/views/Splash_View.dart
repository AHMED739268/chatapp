<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/AppDescriptionText.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/CenterImageWidget.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/WhatsUpText.dart';
import '../../../auth/presentation/views/Loginin_View.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller2;
  late AnimationController _controller;
  late Animation<Offset> _whatsTextAnimation;
  late Animation<Offset> _appTextAnimation;

  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _whatsTextAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _appTextAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset(0, 0),
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
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../auth/presentation/views/Loginin_View.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
>>>>>>> d71c49a5f65065cef86b4ba80248179a902b2a8c

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
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CenterImageWidget(),
          WhatsUpText(animation: _whatsTextAnimation),
          AppDescriptionText(animation: _appTextAnimation),
=======
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              Assets.splash
             , width: 200,
              height: 200,
            ),
          ),

          Positioned.fill(
            child: SlideTransition(
              position: _whatsTextAnimation,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 170), // Adjust position below the image
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
                  padding: const EdgeInsets.only(top: 100.0, left: 150,right: 70), // Adjust to align with "Whats"
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


>>>>>>> d71c49a5f65065cef86b4ba80248179a902b2a8c
        ],
      ),
    );
  }
}
