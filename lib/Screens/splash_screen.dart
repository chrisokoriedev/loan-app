import 'dart:async';
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedSplashScreen(splash: Column(
          children: [
            Image.asset('Assets/images/splash screen.png'),
           const  Text('Fast Credit Limited', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
           )

          ],
        ),
            backgroundColor: Colors.greenAccent,
            splashIconSize: 250,
            duration: 5000,
            splashTransition: SplashTransition.slideTransition,
            nextScreen: const First())


    );
  }
}
