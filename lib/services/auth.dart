// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/main.dart';
// import 'package:fit_fraternity_of_information_technology/wall/news_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
// import '../screens/sign_in/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../page/user_page.dart';
import '../screens/sign_in/sign_in.dart';

class AuthService {
  late final User? firebaseuser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
//   @override
// void onready(){
//   firebaseuser = User?(_auth.currentUser);
// }
  // register with email & password
  Future registerInWithEmailAndPassword(
      String name,
      String mobile,
      String email,
      String prn,
      String dateofbirth,
      String password,
      BuildContext context) async {
    try {
      print(email);
      print(dateofbirth);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('users').add(UserModel(
            name: name,
            mobile: mobile,
            email: email,
            prn: prn,
            dateofbirth: dateofbirth,
            password: password,
          ).toJson());

      //     .doc(userCredential.user!.uid)
      //     .set({
      //   'name': name,
      //   'email': email,
      //   // 'Date of Birth': dateofbirth,
      //   'mobileNumber': mobile,
      //   'PRN': prn,
      //   'password': password
      // });
      // await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(userCredential.user!.uid)
      //     .set({});

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        print('Verification Email has been sent');
        customSnackBar(context, 'Verification Email has been sent');
        Navigator.pushNamed(context, Signin.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        customSnackBar(context, 'The account already exists for that email! ');
      }
    } catch (e) {
      print(e);
    }
  }

// sign in with email & password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      try {
        if (userCredential.user != null && userCredential.user!.emailVerified
            // &&userCredential.user?.email=="dcdscsdcs"?
            ) {
          Navigator.pushNamed(context, MyHomePage.routeName);
        } else {
          print('not verified');

          ScaffoldMessenger.of(context)
              .showMaterialBanner(customMaterialBanner(context));
        }
      } catch (e) {
        print('email Not Verified');
        customSnackBar(context, 'Verification Email has been sent!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        customSnackBar(
            context, 'No user found for that email, please Sign Up!');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        customSnackBar(context, 'Wrong password provided for that user!');
      }
    }
  }

// Sign Out
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Signin()));
  }
}

// // final currentuser = FirebaseAuth.instance.currentUser!;
// Future<String> getusername() async {
//   final currentuser = FirebaseAuth.instance.currentUser!;
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('email', isEqualTo: currentuser.email)
//       .get();
//   return querySnapshot.docs[0].data()['name'];
//   // return "ygyg";
// }

// Future<String> getusermobile() async {
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('email', isEqualTo: currentuser.email)
//       .get();
//   return querySnapshot.docs[0].data()['mobile'];
//   // return "ygyg";
// }

// Future<String> getuserprn() async {
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('email', isEqualTo: currentuser.email)
//       .get();
//   return querySnapshot.docs[0].data()['PRN'];
//   // return "ygyg";
// }

// Future<String> getuseremail() async {
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('email', isEqualTo: currentuser.email)
//       .get();
//   return querySnapshot.docs[0].data()['email'];
//   // return "ygyg";
// }

Future<UserModel> getUserDetails(String email) async {
  final snapshot = await FirebaseFirestore.instance
      .collection("users")
      .where("email", isEqualTo: email)
      .get();
  final userdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  return userdata;
}

Future getEventsDetails(String email) async {
  final snapshot =
      await FirebaseFirestore.instance.collection("events").doc("event1").get();
  print(snapshot.data());
  // final eventsdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  // return userdata;
}

class UserModel {
  final String? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? prn;
  final String? dateofbirth;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.prn,
    this.dateofbirth,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "mobileNumber": mobile,
      "email": email,
      "PRN": prn,
      "dateofbirth": dateofbirth,
      "password": password
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      name: data["name"],
      mobile: data["mobileNumber"],
      email: data["email"],
      prn: data["PRN"],
      dateofbirth: data["dateofbirth"],
      password: data["password"],

      // id: document.id,
    );
  }
}

final currentuser = FirebaseAuth.instance.currentUser!;
Future<String> getuser() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    // Accessing the first document in the query snapshot
    var userData = querySnapshot.docs[0].data();
    return userData['name'];
    // print("name");
  }
  // Handle the case when no documents match the query
  return '';
  // return querySnapshot.docs[0].data()['name'];
}

// Stream<String> getUserStream() async* {
//   yield await getuser();
// }
// Stream<String> getUserStream() {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     final userDoc =
//         FirebaseFirestore.instance.collection('users').doc(user.uid);
//     return userDoc.snapshots().map((snapshot) => snapshot['PRN'] ?? 'hi');
//   } else {
//     return Stream.value('hi vaibhav');
//   }
// }

// String getCurrentUserEmail() {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final User? user = auth.currentUser;

//   if (user != null) {
//     final String email = user.email ?? '';
//     return email;
//   } else {
//     // User is not signed in
//     return '';
//   }
// }

//                 FutureBuilder(
//               future: getUserDetails(currentuser.email.toString()),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   UserModel? userdata = snapshot.data as UserModel;
//                   return
//
// Text("") } else if (snapshot.hasError) {
//                   return Text(snapshot.hasError.toString());
//                 } else
//                   return Text("_");
//               }),