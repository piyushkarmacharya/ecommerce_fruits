import 'package:ecommerce_fruits/main.dart';
import 'package:ecommerce_fruits/pages/basket_page/basket_page.dart';
import 'package:ecommerce_fruits/pages/home_screen/components/combo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Map<String, String>> combo = [
    {
      "name": "Honey lime combo",
      "price": "2,000",
      "image": "assets/images/Honey_lime_combo.png",
      "contains":
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
      "message":
          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Berry_mango_combo.png",
      "contains":
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
      "message":
          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
    },
    {
      "name": "Honey lime combo",
      "price": "2,000",
      "image": "assets/images/Honey_lime_combo.png",
      "contains":
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
      "message":
          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Berry_mango_combo.png",
      "contains":
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
      "message":
          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Berry_mango_combo.png",
      "contains":
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
      "message":
          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make"
    }
  ];
  final TextStyle _unselectedStyle = const TextStyle(
      fontSize: 18,
      color: Color(0xFF938DB5),
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500);
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Color(0xFFF3F4F9),
    ),
  );

  String _selected = "Hottest";
  Widget getText(String str) {
    if (_selected == str) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: str.substring(0, 2),
              style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xFF27214D),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFFFA451),
                  decorationThickness: 3),
            ),
            TextSpan(
                text: str.substring(2, str.length),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF27214D),
                  letterSpacing: 0.5,
                )),
          ],
        ),
      );
    } else {
      return GestureDetector(
          onTap: () {
            setState(() {
              _selected = str;
            });
          },
          child: Text(str, style: _unselectedStyle));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final name = ref.watch(userProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(BasketPage.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/basket.svg",
                )),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 0, 0, 0),
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/menu.svg")),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello $name, ",
                      style: const TextStyle(
                          color: Color(0xFF27214D),
                          fontSize: 20,
                          letterSpacing: 1),
                    ),
                    const TextSpan(
                        text: "What fruit salad combo do you want today?",
                        style: TextStyle(
                            color: Color(0xFF27214D),
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF86869E),
                        ),
                        errorMaxLines: 1,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, // Adjust vertical padding for text
                          horizontal: 20, // Adjust horizontal padding
                        ),
                        hintText: "Search for fruit salad combos",
                        hintStyle: const TextStyle(color: Color(0xFF86869E)),
                        filled: true,
                        fillColor: const Color(0xFFF3F4F9),
                        focusedBorder: borderStyle,
                        enabledBorder: borderStyle,
                        border: borderStyle,
                        errorBorder: borderStyle),
                  )),
                  const SizedBox(
                    width: 4,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/filter.svg"))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Recommended Combo",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF27214D)),
              ),
              SizedBox(
                height: 0.29 * screenSize.height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: combo.length,
                  itemBuilder: (context, index) {
                    final data = combo[index];
                    return ComboCard(
                      index: index,
                      data: data,
                      sizeBig: true,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    getText("Hottest"),
                    const SizedBox(
                      width: 32,
                    ),
                    getText("Popular"),
                    const SizedBox(
                      width: 32,
                    ),
                    getText("New combo"),
                    const SizedBox(
                      width: 32,
                    ),
                    getText("Top"),
                  ],
                ),
              ),
              SizedBox(
                height: 0.27 * screenSize.height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: combo.length,
                  itemBuilder: (context, index) {
                    final data = combo[index];
                    return ComboCard(data: data, sizeBig: false, index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
