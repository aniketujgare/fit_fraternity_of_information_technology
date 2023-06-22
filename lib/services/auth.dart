import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/main.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
// import '../screens/sign_in/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/sign_in/sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register with email & password
  Future registerInWithEmailAndPassword(
      String name,
      String mobile,
      // String dateofbirth,
      String email,
      String prn,
      String password,
      BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        // 'Date of Birth': dateofbirth,
        'mobileNumber': mobile,
        'PRN': prn,
        'password': password
      });
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

final currentuser = FirebaseAuth.instance.currentUser!;
Future<String> getusername() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['name'];
  // return "ygyg";
}

Future<String> getusermobile() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['mobile'];
  // return "ygyg";
}

Future<String> getuserprn() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['PRN'];
  // return "ygyg";
}

Future<String> getuseremail() async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser.email)
      .get();
  return querySnapshot.docs[0].data()['email'];
  // return "ygyg";
}
