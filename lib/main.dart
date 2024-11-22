import "package:ecommerce_fruits/pages/authentication_page/authentication_page.dart";
import "package:ecommerce_fruits/pages/home_screen/home_screen.dart";
import "package:ecommerce_fruits/pages/welcome_page/welcome_page.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce Fruits",
      theme: ThemeData(
        fontFamily: 'BricolageGrotesque',
        primaryColor: const Color(0xFFFFA451),
        scaffoldBackgroundColor: const Color(0xFFFFA451),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color(0xFFFFA451),
          ),
        ),
      ),
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        AuthenticationPage.routeName: (context) => const AuthenticationPage(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
