import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';
import '../Address.dart';
import '../Bottomnavigationbar.dart';
import '../Orderscreens.dart/order.dart';
import '../Orderscreens.dart/trackorder.dart';
import '../Profilescreens/AppSettings.dart';
import '../Profilescreens/Profilesettings.dart';
import '../page_1.dart';

// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;
  int v;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        address: Address.fromJson(json["address"]),
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        phone: json["phone"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "phone": phone,
        "__v": v,
      };
}

class Address {
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        geolocation: Geolocation.fromJson(json["geolocation"]),
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "geolocation": geolocation.toJson(),
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
      };
}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });

  String lat;
  String long;

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class Name {
  Name({
    required this.firstname,
    required this.lastname,
  });

  String firstname;
  String lastname;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  late String stringResponse;
  late Map mapResponse;
  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/users/1'));

    if (response.statusCode == 200) {
      // then parse the JSON.

      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(stringResponse);
      });
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load ');
    }
    return Album.fromJson(jsonDecode(response.body));
  }

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: Bottomnavigationbar(),
            appBar: AppBar(
              backgroundColor: buttonColor,
              title: const Text('Profile'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 8),
                                  child: Container(
                                    color: Colors.green[50],
                                    // ignore: sort_child_properties_last
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'USER DETAILS',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Profilesettings()));
                                                  },
                                                  icon: Icon(Icons.settings))
                                            ]),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Column(children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              " Hii ${mapResponse['name']['firstname'].toString()} ${mapResponse['name']['lastname'].toString()}!!",
                                              style: screenHeadingTextStyle,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.phone),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text("${(snapshot.data!.phone)}"),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.mail),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text(
                                                  " ${(snapshot.data!.email)}"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.home),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text(
                                                "ADDRESS : ",
                                              ),
                                            ],
                                          ),
                                          // Text(
                                          //     " Geolocation : ${mapResponse['address']['geolocation'].toString()}"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      " City :${mapResponse['address']['city'].toString()}"),
                                                  Text(
                                                      "Street:  ${mapResponse['address']['street'].toString()}"),
                                                  Text(
                                                      "Number : ${mapResponse['address']['number'].toString()}"),
                                                  Text(
                                                      "Zipcode: ${mapResponse['address']['zipcode'].toString()}")
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Text('data'),
                                                        ));
                                                  },
                                                  icon: Icon(Icons.timelapse)),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyOrder(),
                                                        ));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)),
                                              title: Text('My Orders'),
                                            ),
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .local_shipping_sharp)),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Timelineorder()));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)),
                                              title: Text('Track Order'),
                                            ),
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Text('data'),
                                                        ));
                                                  },
                                                  icon: Icon(Icons.timelapse)),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyAddress(),
                                                        ));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)),
                                              title: Text('Address'),
                                            ),
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Text('data'),
                                                        ));
                                                  },
                                                  icon: Icon(Icons.timelapse)),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Text('contact'),
                                                        ));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)),
                                              title: Text('Contact us'),
                                            ),
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.timelapse)),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              AppSettings(),
                                                        ));
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios)),
                                              title: Text('Settings'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ListTile(
                                              leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Page1(),
                                                        ));
                                                  },
                                                  icon: Icon(Icons.timelapse)),
                                              title: Text('Logout'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          );
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     border: Border.all())
                        }

                        // children: [
                        //   Text(snapshot.data!.email),
                        // ],
                        return Center(child: const CircularProgressIndicator());
                      }),
                ],
              ),
            ))); // By default, show a loading spinner.
  }
}
