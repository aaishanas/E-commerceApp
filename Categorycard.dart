import 'package:flutter/material.dart';

import '../constant.dart';

class CategeroryCard extends StatelessWidget {
  CategeroryCard({required this.text, required this.image});
  String text;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 74,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 248, 234),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(image)),
          Text(text, style: cardTextStyle)
        ],
      ),
    );
  }
}
