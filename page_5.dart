// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first/Pages/page_6.dart';
import 'package:my_first/constant.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Center(
              child: Text(
                'User Credentials',
                style: screenHeadingTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: buttonColor),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                hintText: 'Enter username',
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    suffixIcon: Icon(Icons.visibility_off)),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Confirm password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: buttonColor),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    suffixIcon: Icon(Icons.visibility_off)),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page6(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                fixedSize: Size(290, 40)),
          ),
        ],
      ),
    );
  }
}
