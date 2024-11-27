import 'package:ecommerce_fruits/pages/add_to_basket_page/add_to_basket_page.dart';
import 'package:flutter/material.dart';

class ComboCard extends StatefulWidget {
  final Map<String, String> data;
  final bool sizeBig;
  final int index;
  const ComboCard(
      {super.key,
      required this.data,
      required this.sizeBig,
      required this.index});

  @override
  State<ComboCard> createState() => _ComboCardState();
}

class _ComboCardState extends State<ComboCard> {
  bool favoritee = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 8, widget.sizeBig ? 16 : 0),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              color: widget.sizeBig
                  ? Colors.white
                  : (widget.index % 2 == 0
                      ? const Color(0xFFFFA451).withOpacity(0.05)
                      : const Color(0xFFF1EFF6).withOpacity(0.05)),
              borderRadius: BorderRadius.circular(16)),
          width: widget.sizeBig
              ? 0.45 * screenSize.width
              : 0.43 * screenSize.width,
          child: GridTile(
            header: GridTileBar(
              title: const Text(""),
              //keep this to align traling to right side
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      favoritee = !favoritee;
                    });
                  },
                  child: Icon(
                    favoritee == true
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: const Color(0xFFFFA451),
                  ),
                ),
              ),
            ),
            footer: GridTileBar(
              title: const Text(""), //keep this to align traling to right side
              trailing: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, 8.0, widget.sizeBig ? 16 : 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AddToBasketPage.routeName, arguments: data);
                  },
                  child: ClipOval(
                    child: Container(
                      color: const Color(0xFFFFA451).withOpacity(0.2),
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
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(data['image'].toString())),
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
                            color: Color(0xFFF08626), fontSize: 14))
                  ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
