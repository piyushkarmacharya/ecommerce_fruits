import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.6 * screenSize.height,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Get The Fresgesr Fruit Salad Combo",
                        style: TextStyle(
                            color: Color(0xFF27214D),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 54),
                      child: Text(
                        "We deliver the best and fresh fruit salad in town. Order for a combo today!!!",
                        style: TextStyle(
                            color: Color(0xFF5D577E),
                            fontSize: 16,
                            letterSpacing: -1),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Let's Continue",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
