// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_first/Pages/Dropdownlist.dart/statelist.dart';
import 'package:my_first/Pages/Profilescreens/ProfilePage.dart';
import 'package:my_first/constant.dart';

class MyAddress extends StatefulWidget {
  MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController addressLineEditingController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final _city = ['kollam', 'Thiruvanathapuram', 'ernakulam'];
  final _state = ['kerala', 'karnataka', 'Tamilnadu'];
  String? dropDownValue = null;
  String? selectedValue = null;

  @override
  void dispose() {
    addressEditingController.dispose();
    addressLineEditingController.dispose();
    super.dispose();
  }

  // List<String> items = [
  //   "",
  //   "Andhra Pradesh",
  //   "Arunachal Pradesh ",
  //   "Assam",
  //   "Bihar",
  //   "Chhattisgarh",
  //   "Goa",
  //   "Gujarat",
  //   "Haryana",
  //   "Himachal Pradesh",
  //   "Jammu and Kashmir",
  //   "Jharkhand",
  //   "Karnataka",
  //   "Kerala",
  //   "Madhya Pradesh",
  //   "Maharashtra",
  //   "Manipur",
  //   "Meghalaya",
  //   "Mizoram",
  //   "Nagaland",
  //   "Odisha",
  //   "Punjab",
  //   "Rajasthan",
  //   "Sikkim",
  //   "Tamil Nadu",
  //   "Telangana",
  //   "Tripura",
  //   "Uttar Pradesh",
  //   "Uttarakhand",
  //   "West Bengal",
  //   "Andaman and Nicobar Islands",
  //   "Chandigarh",
  //   "Dadra and Nagar Haveli",
  //   "Daman and Diu",
  //   "Lakshadweep",
  //   "National Capital Territory of Delhi",
  //   "Puducherry"
  // ];
  // String? selecteditem = "";
  String? selectedcity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          iconTheme: IconThemeData(color: buttonColor),
          backgroundColor: Colors.white,
          title: Text('Address', style: TextStyle(color: buttonColor)),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Profile_screen()));
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                height: 80,
                // ignore: prefer_const_constructors
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Current Location',
                          style: addressTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Delivering to Kakkanad, 682030')),
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
              ),
            ]),
          ),
          // ignore: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                      color: Colors.white,
                      height: 340,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Address',
                                style: addressTextStyle,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Address Line 1',
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: buttonColor),
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Address Line 1',
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: buttonColor),
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButtonFormField(
                                    dropdownColor: Colors.white,
                                    focusColor: Colors.white,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Select your City',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: buttonColor),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: buttonColor),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: buttonColor, width: 2),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    items: _city
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      setState(
                                        () {
                                          dropDownValue = value!;
                                        },
                                      );
                                    },
                                    value: dropDownValue),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 60,
                                        width: double.infinity,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Colors.white,
                                          iconSize: 10,
                                          focusColor: Colors.white,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: 'Select your state',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: buttonColor),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: buttonColor),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: buttonColor),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                          items: _state
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e),
                                                  ))
                                              .toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue!;
                                            });
                                          },
                                          value: selectedValue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: pinCodeController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: buttonColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
                                          hintText: 'PinCode',
                                          hintStyle:
                                              TextStyle(color: buttonColor),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: buttonColor),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      )),
                ]),
          )
        ]));
  }
}
