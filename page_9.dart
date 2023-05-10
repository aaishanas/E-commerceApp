// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first/Pages/Homepage.dart';
import 'package:my_first/constant.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 70),
          Center(
            child: Text(
              'Enable Location',
              style: splashScreenMainTextStyle,
            ),
          ),
          Center(
            child: Text(
              '\n We will need your location to give you better experience.',
              style: splashScreenSubTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  fixedSize: Size(
                    300,
                    40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Text('k')));
                },
                child: Text(
                  'Enable Location',
                  style: loginButtonTextStyle,
                )),
          ),
          Center(
              child: TextButton(
            style: ButtonStyle(),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              'Not now',
              style: TextStyle(color: Colors.black),
            ),
          )),
        ],
      ),
    );
  }
}
