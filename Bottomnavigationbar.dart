// ignore_for_file: unused_element, unused_field, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_first/Pages/Cartscreen.dart/Cart.dart';

import 'package:my_first/Pages/Profilescreens/ProfilePage.dart';
import 'package:my_first/Pages/Homepage.dart';
import 'package:my_first/Pages/Wishlist.dart';
import 'package:my_first/constant.dart';

import 'Homepages_screens/ProfileScreen.dart';

class Bottomnavigationbar extends StatefulWidget {
  Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  final Pages = [
    HomePage(),
    const MyCart(),
    const Wishlist(),
    const Profilescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.values[1],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Pages.elementAt(index),
            ));
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: _selectedIndex == 0 ? buttonColor : Colors.grey,

      // buttonColor,
      // showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: 'Add to cart'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
