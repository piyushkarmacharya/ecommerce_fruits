import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("HomePage"),
    );
  }
}
