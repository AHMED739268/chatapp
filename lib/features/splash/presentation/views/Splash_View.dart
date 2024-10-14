import 'package:flutter/material.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/AppDescriptionText.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/CenterImageWidget.dart';
import 'package:miniwhatsapp/features/splash/presentation/views/widget/WhatsUpText.dart';
import '../../../auth/presentation/views/Loginin_View.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _whatsController;
  late AnimationController _appController;
  late Animation<Offset> _whatsTextAnimation;
  late Animation<Offset> _appTextAnimation;

  @override
  void initState() {
    super.initState();

    _whatsController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _appController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _whatsTextAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _whatsController,
      curve: Curves.easeInOut,
    ));

    _appTextAnimation = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _appController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _whatsController.forward();
    _appController.forward();

    // Navigate to login view after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogininView()),
      );
    });
  }

  @override
  void dispose() {
    _whatsController.dispose();
    _appController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const CenterImageWidget(), // Assuming this widget displays the center image
          Positioned.fill(
            child: SlideTransition(
              position: _whatsTextAnimation,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 170),
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
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 150, right: 70),
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
