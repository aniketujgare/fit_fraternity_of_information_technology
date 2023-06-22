import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/wall/messages.dart';
import 'package:fit_fraternity_of_information_technology/wall/new_chat.dart';
import 'package:flutter/material.dart';
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
    getusername();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text(
            "The Wall",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500),
          ),
          // centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.grey[200]),
      // ignore: prefer_interpolation_to_compose_strings
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 600,
          child: Column(children: [
            // FutureBuilder(
            //   future: getuser(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(
            //         "logged in as " + snapshot.requireData,
            //       );
            //     } else {
            //       return Text('User!');
            //     }
            //   },
            // ),
            Expanded(child: Messages()),
            NewChat(),
          ]),
        ),
      ),
    );
  }
}

final currentuser = FirebaseAuth.instance.currentUser!;
Future<String> getusername() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['name'];
  // return "ygyg";
}
