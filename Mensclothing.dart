import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first/Models/Jewellery.dart';

import 'package:http/http.dart' as http;
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../Models/Mensclothing.dart';
import '../../Models/Product.dart';
import '../../constant.dart';
import 'DetailScreen.dart';

Future<List<Mensclothing>> fetchPost4() async {
  final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/category/men's%20clothing"));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<Mensclothing>((json) => Mensclothing.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class MensclothingScreen extends StatefulWidget {
  MensclothingScreen({super.key});

  @override
  State<MensclothingScreen> createState() => _MensclothingScreenState();
}

class _MensclothingScreenState extends State<MensclothingScreen> {
  Future<List<Mensclothing>>? futurePost4;

  @override
  void initState() {
    super.initState();
    futurePost4 = fetchPost4() as Future<List<Mensclothing>>?;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Flexible(
          child: Column(
            children: [
              // Row(children: [GestureDetector(child: ,onTap: ,)],),

              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "Men's Clothing",
                    style: screenHeadingTextStyle,
                  )
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: FutureBuilder<List<Mensclothing>>(
                        future: fetchPost4(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: ZoomTapAnimation(
                                  onTap: () {
                                    List<Post> postList = [];
                                    postList.add(snapshot.data![index]
                                        as Post); //adding value
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailScreen(postList)));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Image.network(
                                              "${snapshot.data![index].image}"),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          "${snapshot.data![index].title}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          "₹${snapshot.data![index].price.toString()}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 2.2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
// ignore_for_file: unused_element



