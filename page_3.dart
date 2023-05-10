// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first/Pages/page_4.dart';
import 'package:my_first/constant.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: Container(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          decoration: const BoxDecoration(
              color: splashScreenContainerColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
              image: DecorationImage(
                  image: AssetImage(
                'Assets/images/w2.png',
              ))),
        ),
        const SizedBox(height: 40),
        const Text('Fast Doorstep Delivery', style: splashScreenMainTextStyle),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Our Delivery executives will deliver your \n order under 24 hours',
          style: splashScreenSubTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 160),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            child: Text('Get Started'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                fixedSize: Size(130, 40)),
          ),
        )
      ]),
    ));
  }
}
