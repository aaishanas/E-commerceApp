// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first/Pages/page_7.dart';
import 'package:my_first/constant.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Text(
              'User Credentials',
              style: screenHeadingTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email id',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonColor),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonColor),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page7()));
              },
              child: Text('Next'))
        ],
      ),
    );
  }
}
