import 'dart:async';
import 'package:calculator_design/calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Calculator(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 160),
          Image.asset(
            "assets/images/calculator.png",
            height: 120,
          ),
          const Text(
            "Calculator",
            style: TextStyle(
                color: primarycolor, fontSize: 36, fontWeight: FontWeight.w700),
          ),
          // SizedBox(height: 200),
          const Text(
            "@Splash screen design",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 4),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: primarycolor,
              strokeWidth: 4,
            ),
          ),
        ],
      ),
      nextScreen: const Calculator(),
      backgroundColor: hwcolor,
      splashIconSize: 250,
      // duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      );
  }
}
