import 'package:ecommerce_fruits/main.dart';
import 'package:ecommerce_fruits/pages/basket_page/basket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToBasketPage extends ConsumerStatefulWidget {
  static String routeName = "/add-to-basket";
  const AddToBasketPage({super.key});

  @override
  ConsumerState<AddToBasketPage> createState() => _AddToBasketPageState();
}

class _AddToBasketPageState extends ConsumerState<AddToBasketPage> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final data =
        (ModalRoute.of(context)!.settings.arguments) as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFA451),
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(100)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    weight: 700,
                  ),
                  Text("Go back",
                      style: TextStyle(color: Color(0xFF27214D), fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SizedBox(
              height: 0.2 * screenSize.height,
              width: 0.4 * screenSize.width,
              child: Image.asset(
                data['image'].toString(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 0.05 * screenSize.height,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name'].toString(),
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF27214D),
                            letterSpacing: -0.5),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (qty > 0) {
                                      qty--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline_sharp,
                                  size: 32,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(qty.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFF27214D))),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    qty++;
                                  });
                                },
                                icon: CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      const Color(0xFFFFA451).withOpacity(0.3),
                                  child: const Icon(
                                    Icons.add_outlined,
                                    size: 30,
                                    color: Color(0xFFFFA451),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Rs. ${data["price"].toString()}",
                            style: const TextStyle(
                                color: Color(0xFF27214D),
                                fontSize: 24,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        color: Color(0xFFF3F3F3),
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "One Pack Contains:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF27214D),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      const Text(
                        "One Pack Contains:",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            decoration: TextDecoration.overline,
                            decorationColor: Color(0xFFFFA451),
                            decorationThickness: 3),
                      ),
                      Text(
                        data['contains'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF27214D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        color: Color(0xFFF3F3F3),
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        data["message"].toString(),
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.1 * screenSize.height,
            decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 0.035 * screenSize.height,
                      backgroundColor: const Color(0xFFFFA451).withOpacity(0.2),
                      foregroundColor: const Color(0xFFFFA451),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 0.6 * screenSize.width,
                      height: 0.07 * screenSize.height,
                      child: ElevatedButton(
                          onPressed: () {
                            if (qty != 0) {
                              data['quantity'] = qty.toString();
                              ref.read(cartProvider.notifier).addProduct(data);
                              Navigator.of(context)
                                  .pushNamed(BasketPage.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Quantity is 0"),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Add to basket",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 16),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
