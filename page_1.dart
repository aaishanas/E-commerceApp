// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first/Pages/page_4.dart';
import 'package:my_first/constant.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

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
                'assets/images/u1.png',
              ))),
        ),
        const SizedBox(height: 40),
        const Text('Shop your daily needs', style: splashScreenMainTextStyle),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Set you delivery location. Choose your groceries \n from your wide range of your required products.',
          style: splashScreenSubTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 150),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            child: Text('Next'),
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
