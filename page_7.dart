import 'package:flutter/material.dart';
import 'package:my_first/Pages/page_8.dart';
import 'package:my_first/constant.dart';

class Page7 extends StatefulWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  State<Page7> createState() => _Page7();
}

class _Page7 extends State<Page7> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Registration',
              style: screenHeadingTextStyle,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: addressEditingController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: buttonColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: addressLineEditingController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: 'Address Line2',
                      hintStyle: TextStyle(color: buttonColor),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'City',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: buttonColor, width: 2),
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
                        padding: const EdgeInsets.all(15.0),
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
                              labelText: 'State',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: buttonColor),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: buttonColor),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: buttonColor),
                                borderRadius: BorderRadius.circular(18),
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
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: pinCodeController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: buttonColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            hintText: 'PinCode',
                            hintStyle: TextStyle(color: buttonColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: buttonColor),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page8()));
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => buttonColor)),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
