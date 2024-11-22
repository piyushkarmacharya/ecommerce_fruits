import 'package:ecommerce_fruits/pages/authentication_page/authentication_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static String routeName = "/welcome-page";
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.6 * screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: (260 / 812) * screenSize.height,
                  width: (301 / 375) * screenSize.width,
                  child: Image.asset(
                    "assets/images/welcome_page.png",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ClipOval(
                  child: Container(
                    height: (12 / 812) * screenSize.height,
                    width: (301 / 375) * screenSize.width,
                    decoration: const BoxDecoration(color: Color(0xFFF08626)),
                  ),
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Get The Freshest Fruit Salad Combo",
                        style: TextStyle(
                            color: Color(0xFF27214D),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AuthenticationPage.routeName);
                          },
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
