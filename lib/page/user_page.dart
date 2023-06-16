import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../screens/sign_in/components/sign_form.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Profile', style: TextStyle(fontSize: 15)),
        backgroundColor: const Color(0xffF7F7F7),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.border_color,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, SignForm.routeName, (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CircleAvatar(
            radius: 80,
            child: Icon(
              Icons.person,
              size: 90,
              color: Colors.black,
            ),
          )
        ]),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       const SizedBox(
    //         width: double.infinity,
    //         height: 50,
    //       ),
    //       CircleAvatar(
    //         backgroundColor: Colors.transparent,
    //         radius: 120,
    //         // maxRadius: 120,
    //         child: Image.asset('assets/logout-bg.png'),
    //       ),
    //       const SizedBox(height: 50),
    //       SizedBox(
    //         width: double.maxFinite,
    //         height: 45,
    //         child: TextButton(
    //           onPressed: () {
    // auth.signOut();
    // Navigator.pushNamedAndRemoveUntil(
    //     context, SignForm.routeName, (route) => false);
    //           },
    //           style: TextButton.styleFrom(
    // elevation: 5,
    // backgroundColor: Colors.blue,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(18.0),
    //                 side: const BorderSide(color: Colors.blueAccent))),
    //         child: const Text(
    //           'Sign Out',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
