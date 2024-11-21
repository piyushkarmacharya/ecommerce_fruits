import "package:ecommerce_fruits/homepage.dart";
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
      home: const HomePage(),
    );
  }
}
