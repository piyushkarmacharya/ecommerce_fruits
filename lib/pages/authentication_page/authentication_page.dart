import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  static String routeName = "/authentication_page";
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFFF3F1F1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final bool keyboardActive = MediaQuery.of(context).viewInsets.bottom > 0;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Visibility(
            visible: !keyboardActive,
            child: SizedBox(
              height: 0.6 * screenSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: (260 / 812) * screenSize.height,
                    width: (301 / 375) * screenSize.width,
                    child: Image.asset(
                      "assets/images/authentication_page.png",
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
                        "What is your firstname",
                        style: TextStyle(
                            color: Color(0xFF27214D),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32, top: 8),
                      child: SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "first name",
                                filled: true,
                                fillColor: const Color(0xFFF3F1F1),
                                focusedBorder: borderStyle,
                                enabledBorder: borderStyle,
                                border: borderStyle),
                          )),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Start Ordering",
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
