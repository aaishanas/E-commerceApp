import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:my_first/Pages/Homepages_screens/DetailScreen.dart';

import 'package:http/http.dart' as http;
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../Models/Product.dart';
import '../../constant.dart';

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List<Post>>? futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Row(children: [GestureDetector(child: ,onTap: ,)],),

                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'All ITEMS',
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
                        child: FutureBuilder<List<Post>>(
                          future: futurePost,
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
                                      postList.add(
                                          snapshot.data![index]); //adding value
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                          // Text(
                                          //     "${snapshot.data![index].description.toString()}",
                                          //     style: TextStyle(fontSize: 10)),
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
        ),
      )),
    );
  }
}
// ignore_for_file: unused_element
