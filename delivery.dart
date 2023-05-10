// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_first/constant.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String? deliverylocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: buttonColor),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Deliver to',
          style: screenHeadingTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                RadioListTile(
                  title: Text("Current Location"),
                  value: "Current Location",
                  groupValue: deliverylocation,
                  onChanged: (value) {
                    setState(() {
                      deliverylocation = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("new Address"),
                  value: "new Address",
                  groupValue: "newaddress",
                  onChanged: (value) {
                    setState(() {
                      deliverylocation = value.toString();
                    });
                  },
                ),
              ])),
          SizedBox(
            height: 500,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(335, 50)),
              onPressed: () {
                Navigator.pushNamed(context, 'MyCartOne');
              },
              child: Text(
                'Continue',
                style: loginButtonTextStyle,
              )),
        ],
      ),
    );
  }
}
