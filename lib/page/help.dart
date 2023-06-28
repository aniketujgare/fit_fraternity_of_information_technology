import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = '/hep';
  final _key = GlobalKey<FormState>();
  HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // GestureDetector(f(context).pop(),
        //     child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        backgroundColor: Colors.white,
        title: Text(
          textAlign: TextAlign.left,
          'Help & support',
          style: textStyle.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Reach Out to Us - We're Here to Help!",
                style: textStyle.copyWith(fontSize: 23)),
            SizedBox(
              height: 10,
            ),
            Text(
                "Hassle-free support for all your app inquiries. Quick and personalized assistance to enhance your user experience.",
                style: textStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.normal)),
            Form(
                child: Column(
              children: [
                TextFormFieldPulse(
                  hintText: "email",
                  icon: Icon(Icons.email),
                ),
                TextFormFieldPulse(
                  hintText: "email",
                  icon: Icon(Icons.email),
                ),
                TextFormFieldPulse(
                  hintText: "email",
                  icon: Icon(Icons.email),
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
