// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_first/Pages/Homepage.dart';
import 'package:my_first/Pages/page_5.dart';
import 'package:my_first/Pages/page_7.dart';
import 'package:my_first/Pages/page_8.dart';
import 'package:my_first/constant.dart';

import 'Authentication/Homelogin.dart';
import 'Authentication/auth_service.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
            'User Login',
            style: screenHeadingTextStyle,
          ),
        ),
        // Container(
        //   alignment: Alignment.center,
        //   height: 300,
        //   width: 350,
        //   child: Image(image: AssetImage('Assets/images/splashscreen.png')),
        // ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    prefixIcon: Icon(Icons.people),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                // obscureText: pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            child: Text(
              'Forgot password?',
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Container(
                // alignment: Alignment.center,
                child: ButtonTheme(
              minWidth: 650,
              height: 20,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page5(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fixedSize: Size(100, 40)),
              ),
            )),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'SignUpOne');
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Page7())));
                  },
                  child: Text('Sign up'),
                )),
          ],
        ),
        Center(child: Text('Or')),
        GestureDetector(
            onTap: () {
              AuthService().signInWithGoogle();
            },
            child: const Image(
              image: AssetImage('assets/images/google.png'),
              width: 80,
            ))
      ]),
    );
  }
}
