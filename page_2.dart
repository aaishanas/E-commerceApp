// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first/Pages/page_3.dart';

import '../constant.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('Assets/Images/w1.png')),
            color: splashScreenContainerColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(160),
                bottomRight: Radius.circular(160)),
          ),
        ),
        const SizedBox(height: 40),
        const Text('Real Time Reporting', style: splashScreenMainTextStyle),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Keeping track of real-time delivery \n location',
          style: splashScreenSubTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 110),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                fixedSize: Size(100, 40)),
          ),
        )
      ]))),
    );
  }
}
