// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:my_first/Pages/Homepage.dart';
import 'package:my_first/Pages/Homepages_screens/Categoryscreen.dart';

import 'auth_service.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: size.height * 0.2,
            bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Congratulation you are signed in !!!",
                style: TextStyle(fontSize: 30)),
            GestureDetector(
              onTap: () {
                AuthService().signInWithGoogle();
                // HomePage();
              },
              child: Text('Take to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// import 'auth_service.dart';

// class LoginPage extends StatelessWidget {
//   Future<void> signInWithGoogle() async {
//     await AuthService().signInWithGoogle();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: signInWithGoogle,
//           child: Text("Login With Google"),
//         ),
//       ),
//     );
//   }
// }
