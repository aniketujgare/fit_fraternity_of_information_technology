import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/main.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/components/sign_form.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/sign_in/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register with email & password
  Future registerInWithEmailAndPassword(String name, String mobile,
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'mobileNumber': mobile,
      });
      // await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(userCredential.user!.uid)
      //     .set({});

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        // print('Verification Email has been sent');
        customSnackBar(context, 'Verification Email has been sent');
        Navigator.pushNamed(context, SignForm.routeName);
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
        if (userCredential.user != null && userCredential.user!.emailVerified) {
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

//Sign Out
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }
// //*Seller Section

// //Seller Sign Up
//   Future registerSeller(String email, String password, BuildContext context,
//       Seller sellerData) async {
//     try {
//       UserCredential sellerCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) async {
//         CollectionReference sellers =
//             FirebaseFirestore.instance.collection('Sellers');
//         sellerData.id = value.user!.uid;
//         sellers
//             .doc(value.user!.uid)
//             .set(sellerData.toMap())
//             .then((value) => print("Seller Added"))
//             .catchError((error) => print("Failed to add seller: $error"));

//         customSnackBar(context,
//             'Seller succesfully registered, verify email and log-In with your account');
//         throw {print('SuccessFull')};
//       });
//       if (sellerCredential.user != null &&
//           !sellerCredential.user!.emailVerified) {
//         await sellerCredential.user!.sendEmailVerification();
//         Navigator.pushNamed(context, SignInSellerScreen.routeName);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//         customSnackBar(context,
//             'Failed!! Buyer account is already exists for that email! Use another e-mail');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   //Seller Log In
//   Future<void> signInSellerWithEmailAndPassword(
//       String email, String password, BuildContext context) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       try {
//         if (userCredential.user != null && userCredential.user!.emailVerified) {
//           final FirebaseAuth auth = FirebaseAuth.instance;
//           final User? user = auth.currentUser;
//           if (user != null) {
//             FirebaseFirestore.instance
//                 .collection('Sellers')
//                 .doc(user.uid)
//                 .get()
//                 .then((DocumentSnapshot documentSnapshot) {
//               if (documentSnapshot.exists) {
//                 Navigator.pushNamed(context, SellerDashboardScreen.routName);
//               } else {
//                 customSnackBar(
//                     context, 'No seller found for that email, please Sign Up!');
//               }
//             });
//           }
//         } else {
//           print('not verified');

//           ScaffoldMessenger.of(context)
//               .showMaterialBanner(customMaterialBanner(context));
//         }
//       } catch (e) {
//         print('email Not Verified');
//         customSnackBar(context, 'Verification Email has been sent!');
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//         customSnackBar(
//             context, 'No seller found for that email, please Sign Up!');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that seller.');
//         customSnackBar(context, 'Wrong password provided for that seller!');
//       }
//     }
//   }
}
