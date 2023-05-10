import 'package:flutter/material.dart';
import 'package:my_first/Pages/Homepages_screens/Mensclothing.dart';

import 'package:my_first/Pages/page_3.dart';
import 'package:my_first/Pages/page_5.dart';

import '../constant.dart';
import 'Bottomnavigationbar.dart';
import 'Homepages_screens/Categoryscreen.dart';
import 'Homepages_screens/Electronicsscreen.dart';
import 'Homepages_screens/Jewelleryscreen.dart';
import 'Homepages_screens/Womensclothingscreen.dart';
import 'Notification.dart';
import 'homescreenwidgets/searchbar.dart';
import 'page_2.dart';
import 'page_6.dart';

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottomnavigationbar(),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    child: Searchbar(
                      wid: 300,
                    ),
                  ),
                  IconButton(
                      color: buttonColor,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyNotification(),
                            ));
                      },
                      icon: Icon(Icons.notifications)),
                ],
              ),
            ),
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: buttonColor,
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    InkWell(
                      onTap: () => _tabController.animateTo(0),
                      child: Tab(
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _tabController.animateTo(1),
                      child: Tab(
                        child: Text(
                          'Electronics',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _tabController.animateTo(2),
                      // ignore: prefer_const_constructors
                      child: Tab(
                        child: Text(
                          'Jewellery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _tabController.animateTo(3),
                      child: Tab(
                        child: Text(
                          "Men's clothing",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _tabController.animateTo(4),
                      // ignore: prefer_const_constructors
                      child: Tab(
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Women's clothing",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CategoryScreen(),
                  ElectronicsScreen(),
                  JewelleryScreen(),
                  MensclothingScreen(),
                  WomensclothingScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
