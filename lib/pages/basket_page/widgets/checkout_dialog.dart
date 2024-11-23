import 'package:ecommerce_fruits/pages/order_complete_page.dart/order_complete_page.dart';
import 'package:flutter/material.dart';

class CheckoutDialog extends StatefulWidget {
  const CheckoutDialog({super.key});

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFFF3F1F1),
    ),
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool keyboardActive = MediaQuery.of(context).viewInsets.bottom > 0;
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          Visibility(
            visible: !keyboardActive,
            child: Container(
              height: 0.5 * screenSize.height,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Color(0xFFFFFFFF),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Delivery address",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF27214D),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter delivery address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                errorMaxLines: 1,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical:
                                      18, // Adjust vertical padding for text
                                  horizontal: 16, // Adjust horizontal padding
                                ),
                                hintText: "Bhaktapur, Nepal",
                                hintStyle:
                                    const TextStyle(color: Color(0xFFC2BDBD)),
                                filled: true,
                                fillColor: const Color(0xFFF3F1F1),
                                focusedBorder: borderStyle,
                                enabledBorder: borderStyle,
                                border: borderStyle,
                                errorBorder: borderStyle),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Number we can call",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF27214D),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter contact number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                errorMaxLines: 1,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical:
                                      18, // Adjust vertical padding for text
                                  horizontal: 16, // Adjust horizontal padding
                                ),
                                hintText: "+9779800000000",
                                hintStyle:
                                    const TextStyle(color: Color(0xFFC2BDBD)),
                                filled: true,
                                fillColor: const Color(0xFFF3F1F1),
                                focusedBorder: borderStyle,
                                enabledBorder: borderStyle,
                                border: borderStyle,
                                errorBorder: borderStyle),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 0.07 * screenSize.height,
                                width: 0.4 * screenSize.width,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.of(context).pushNamed(
                                            OrderCompletePage.routeName);
                                      }
                                    },
                                    child: Text(
                                      "Pay on delivery",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          letterSpacing: -0.5),
                                    )),
                              ),
                              SizedBox(
                                height: 0.07 * screenSize.height,
                                width: 0.4 * screenSize.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor))),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {}
                                  },
                                  child: Text(
                                    "Pay with card",
                                    style: TextStyle(
                                        letterSpacing: -0.5,
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
