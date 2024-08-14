import 'package:anime_world_tutorial/Screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 253, 176, 60),
          Color.fromARGB(255, 253, 176, 60),
        ],
      ),
      childWidget: SizedBox(
        height: 190,
        child: Image.asset("lib/assets/logo.jpeg"),
      ),
      duration: const Duration(milliseconds: 3500),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen: const HomeScreen(),
    );
  }
}
