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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CenterImageWidget(),
          WhatsUpText(animation: _whatsTextAnimation),
          AppDescriptionText(animation: _appTextAnimation),
        ],
      ),
    );
  }
}
