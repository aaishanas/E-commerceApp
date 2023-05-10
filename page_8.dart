// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:my_first/Pages/page_9.dart';
import 'package:my_first/constant.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
                child: Text(
              'Verification',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
          Center(child: Text('Enter OTP code sent your number')),
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Myotp(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  fixedSize: Size(
                    250,
                    40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page9()));
                },
                child: Text('Next')),
          )
        ],
      ),
    );
  }
}

class Myotp extends StatelessWidget {
  const Myotp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 64,
            width: 60,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: hintTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 64,
            width: 60,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: hintTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 64,
            width: 60,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: hintTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 64,
            width: 60,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: hintTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
