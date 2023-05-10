// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_first/Pages/Homepage.dart';
import 'package:my_first/constant.dart';

class MyNotification extends StatefulWidget {
  MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificatioState();
}

class _MyNotificatioState extends State<MyNotification> {
  int _selectedIndex = 0;

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.green),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.green,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Container(
                  child: Image.asset('Assets/Images/No notification 1.png')),
              Text(
                'No Notifications',
                style: splashScreenMainTextStyle,
              ),
              Text(
                "It seems like you haven't \nreceived any notifications yet",
                style: splashScreenSubTextStyle,
              ),

              // ignore: prefer_const_literals_to_create_immutables
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
