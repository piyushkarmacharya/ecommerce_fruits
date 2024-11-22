import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> combo = [
    {
      "name": "Honey lime combo",
      "price": "2,000",
      "image": "assets/images/Honey_lime_combo.png"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Honey_lime_combo.png"
    },
    {
      "name": "Honey lime combo",
      "price": "2,000",
      "image": "assets/images/Honey_lime_combo.png"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Honey_lime_combo.png"
    },
    {
      "name": "Honey lime combo",
      "price": "2,000",
      "image": "assets/images/Honey_lime_combo.png"
    },
    {
      "name": "Berry mango combo",
      "price": "8,000",
      "image": "assets/images/Honey_lime_combo.png"
    }
  ];
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Color(0xFFF3F4F9),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final name = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['name'];
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
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
              height: 24,
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
              height: 32,
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
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 8, 16),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          width: 0.45 * screenSize.width,
                          child: GridTile(
                            header: GridTileBar(
                              title: const Text(""),
                              //keep this to align traling to right side
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_outline,
                                    color: Color(0xFFFFA451),
                                  ),
                                ),
                              ),
                            ),
                            footer: GridTileBar(
                              title: const Text(
                                  ""), //keep this to align traling to right side
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 8.0, 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ClipOval(
                                    child: Container(
                                      color: const Color(0xFFFFA451)
                                          .withOpacity(0.2),
                                      child: const Icon(
                                        Icons.add,
                                        color: Color(0xFFFFA451),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 20, 16, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Image.asset(
                                          data['image'].toString())),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    data['name'].toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        letterSpacing: -0.5,
                                        fontSize: 16,
                                        color: Color(0xFF27214D),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                      text: "Rs. ",
                                      style: TextStyle(
                                          color: Color(0xFFF08626),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                        text: data['price'].toString(),
                                        style: const TextStyle(
                                            color: Color(0xFFF08626),
                                            fontSize: 14))
                                  ])),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
