import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixels/pages/home/home.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    timer = Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacementNamed(Home.routeName);
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'pixelsAbout',
              transitionOnUserGestures: true,
              child: Image.asset(
                'assets/pixels_white.png',
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            const SizedBox(height: 30),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Pixels Egypt',
                  textStyle: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
