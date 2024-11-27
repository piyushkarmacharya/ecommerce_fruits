import 'package:ecommerce_fruits/main.dart';
import 'package:ecommerce_fruits/pages/basket_page/widgets/checkout_dialog.dart';
import 'package:ecommerce_fruits/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketPage extends ConsumerStatefulWidget {
  static String routeName = "/basket-page";
  const BasketPage({super.key});

  @override
  ConsumerState<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends ConsumerState<BasketPage> {
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFFF3F1F1),
    ),
  );
  // final List<Map<String, String>> basket = [
  //   {
  //     "name": "Berry mango combo",
  //     "price": "8000",
  //     "quantity": "2",
  //     "image": "assets/images/Berry_mango_combo.png",
  //     "contains":
  //         "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
  //     "message":
  //         "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
  //   },
  // ];

  int getTotal(List data) {
    int total = 0;
    for (int i = 0; i < data.length; i++) {
      total = total +
          (int.parse(data[i]['price']) * int.parse(data[i]['quantity']));
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final basket = ref.watch(cartProvider);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
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
                          style: TextStyle(
                              color: Color(0xFF27214D), fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            const Text(
              "My Basket",
              style: TextStyle(
                  fontSize: 26, color: Color(0xFFFFFFFF), letterSpacing: -0.5),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: ListView.builder(
                  itemCount: basket.length,
                  itemBuilder: (context, index) {
                    final data = basket[index];
                    return SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      elevation: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? const Color(0xFFFFA451)
                                                    .withOpacity(0.05)
                                                : const Color(0xFFF1EFF6)
                                                    .withOpacity(0.05)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Image.asset(
                                              data['image'].toString(),
                                              width: 40,
                                              height: 40),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["name"].toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF000000)),
                                          ),
                                          Text("${data['quantity']} packs",
                                              style:
                                                  const TextStyle(fontSize: 14))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Rs. ${int.parse(data["price"].toString()) * int.parse(data["quantity"].toString())}",
                                  style: const TextStyle(
                                      color: Color(0xFF27214D),
                                      fontSize: 16,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFF4F4F4),
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  }),
            )),
            SizedBox(
              height: 0.1 * screenSize.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Total",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF000000),
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w600)),
                        Text(
                          "Rs. ${getTotal(basket)}",
                          style: const TextStyle(
                              fontSize: 24,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 0.07 * screenSize.height,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CheckoutDialog();
                              },
                            );
                          },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 16),
                          )),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
