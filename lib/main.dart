import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/splash/presentation/views/Splash_View.dart';

import 'features/splash/presentation/views/Splash_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      home: SplashView(),
<<<<<<< HEAD
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
=======
>>>>>>> d71c49a5f65065cef86b4ba80248179a902b2a8c

    );


  }}