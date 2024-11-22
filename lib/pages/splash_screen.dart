import 'package:ecommerce_fruits/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() {
    Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      navigate();
    });
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SizedBox(
            child: Image.asset(
          "assets/images/splash.png",
          height: (205.05 / 812) * screenSize.height,
          width: (184 / 375) * screenSize.width,
        )),
      ),
    );
  }
}
