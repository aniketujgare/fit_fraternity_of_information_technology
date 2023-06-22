import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/size_config.dart';
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
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredmessage,
      'userId': user.uid,
      'createdAt': Timestamp.now(),
      'userName': userData.data()!['name'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: messagecontroller,
              decoration: InputDecoration(
                  labelText: 'Send a message...',
                  fillColor: Colors.white,
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
