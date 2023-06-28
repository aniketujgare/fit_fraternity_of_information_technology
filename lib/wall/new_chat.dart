import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:flutter/material.dart';

class NewChat extends StatefulWidget {
  const NewChat({super.key});

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final messagecontroller = TextEditingController();

  @override
  void dispose() {
    messagecontroller.dispose();
    super.dispose();
  }

  void submitmessage() async {
    final enteredmessage = messagecontroller.text;

    if (enteredmessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus(); //for closing keyboard
    messagecontroller.clear();
    //send to firebase
    final user = FirebaseAuth.instance.currentUser!;

    // final userData = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .get();
    final currentUser = FirebaseAuth.instance.currentUser!;
    final userName = await getUserName(currentUser.email!);

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredmessage,
      'userId': user.uid,
      'createdAt': Timestamp.now(),
      'userName': userName,
      // userData['name'],
    });
  }

  Future<String> getUserName(String email) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      // Accessing the first document in the query snapshot
      var userData = querySnapshot.docs[0].data();
      return userData['name'];
    }
    // Handle the case when no documents match the query
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: messagecontroller,
              decoration: InputDecoration(
                  labelText: 'Send a message...',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            )),
            IconButton(onPressed: submitmessage, icon: Icon(Icons.send))
          ],
        )
      ]),
    );
  }
}
//  Future<String> getUserName(String email) async {
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('email', isEqualTo: email)
//       .get();
//   if (querySnapshot.docs.isNotEmpty) {
//     // Accessing the first document in the query snapshot
//     var userData = querySnapshot.docs[0].data();
//     return userData['name'];
//   }
//   // Handle the case when no documents match the query
//   return '';
// }