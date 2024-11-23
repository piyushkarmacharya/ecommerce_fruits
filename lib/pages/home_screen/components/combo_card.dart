import 'package:flutter/material.dart';

class ComboCard extends StatefulWidget {
  final Map<String, String> data;
  const ComboCard({super.key, required this.data});

  @override
  State<ComboCard> createState() => _ComboCardState();
}

class _ComboCardState extends State<ComboCard> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 8, 16),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
              title: const Text(""), //keep this to align traling to right side
              trailing: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 16),
                child: GestureDetector(
                  onTap: () {},
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
