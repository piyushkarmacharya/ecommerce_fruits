import 'package:flutter/material.dart';

class OrderCompletePage extends StatefulWidget {
  static String routeName = "/order-complete";
  const OrderCompletePage({super.key});

  @override
  State<OrderCompletePage> createState() => _OrderCompletePageState();
}

class _OrderCompletePageState extends State<OrderCompletePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset("assets/images/complete.png"),
              ),
              const SizedBox(height: 56),
              const Text(
                "Congratulations!!!",
                style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFF27214D),
                    letterSpacing: -0.5),
              ),
              const SizedBox(height: 13),
              const Text(
                "Your order have been taken and is being attended to",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF27214D),
                    fontSize: 20,
                    letterSpacing: -0.5),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 0.07 * screenSize.height,
                width: 0.5 * screenSize.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor))),
                  onPressed: () {},
                  child: Text(
                    "Continue shopping",
                    style: TextStyle(
                        letterSpacing: -0.5,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
