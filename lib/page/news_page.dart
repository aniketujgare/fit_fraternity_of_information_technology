import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final textcontroller = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    getuser();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text("The Wall"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[900]),
      // ignore: prefer_interpolation_to_compose_strings
      body: Column(children: [
        FutureBuilder(
          future: getuser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "logged in as " + snapshot.requireData,
              );
            } else {
              return Text('User!');
            }
          },
        ),
        Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ))
          ],
        )
      ]),
    );
    // Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //         colors: [
    //           Color(0xFFF4F0F5),
    //           Color(0xFFF4F0F5),
    //           // Color(0xFFF8E5E7),
    //         ],
    //         begin: FractionalOffset(0.0, 0.0),
    //         end: FractionalOffset(0.0, 1.0),
    //         stops: [0.0, 1.0],
    //         tileMode: TileMode.clamp),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         "News",
    //         style: TextStyle(fontSize: 100),
    //       )
    //     ],
    //   ),
    // );
  }
}

final currentuser = FirebaseAuth.instance.currentUser!;
Future<String> getuser() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['name'];
  // return "ygyg";
}
