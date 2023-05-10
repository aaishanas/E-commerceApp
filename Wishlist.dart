import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_first/Pages/Bottomnavigationbar.dart';
import 'package:my_first/constant.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Wishlist', style: TextStyle(color: buttonColor)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 70),
                //   child: Container(
                //     height: 160,
                //     width: 100,
                //     child: Image.asset('Assets/Images/empty cart 1.png'),
                //   ),
                // ),
                ),
          ),
          SizedBox(
            height: 70,
          ),

          // ignore: prefer_const_constructors
          Text(
            "Its seems like you haven't added any\n items to your wishlist.",
            style: splashScreenSubTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavigationbar(),
    );
  }
}
