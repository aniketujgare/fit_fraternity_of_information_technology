import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/wall/messages.dart';
import 'package:fit_fraternity_of_information_technology/wall/new_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../size_config.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage> {
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
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Container(
          height: getProportionateScreenHeight(630),
          child: Column(children: [
            Expanded(child: Messages()),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            NewChat(),
          ]),
        ),
      ),
    );
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
