import 'dart:ffi';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/main.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../page/user/user_page.dart';
import '../screens/sign_in/sign_in.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
User? currentUser = FirebaseAuth.instance.currentUser;
String? userId = currentUser?.uid;

class StoredData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> saveData({required Uint8List file}) async {
    String resp = "Some Error Occurred";
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      String? userId = currentUser?.uid;

      if (userId != null) {
        String imageURL = await uploadImageToStorage("profileImage", file);

        await _firestore.collection("users").doc(userId).set({
          "imgUrl": imageURL,
        });

        resp = "Data saved successfully";
      } else {
        resp = "User ID not available";
      }
    } catch (error) {
      resp = error.toString();
    }
    return resp;
  }

  Future<String> fetchData() async {
    String resp = "Some Error Occurred";
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      String? userId = currentUser?.uid;

      if (userId != null) {
        DocumentSnapshot snapshot =
            await _firestore.collection("users").doc(userId).get();
        if (snapshot.exists) {
          Map<String, dynamic> userData =
              snapshot.data() as Map<String, dynamic>;
          String imageURL = userData["imgUrl"];
          resp = "Image URL: $imageURL";
        } else {
          resp = "User data not found";
        }
      } else {
        resp = "User ID not available";
      }
    } catch (error) {
      resp = error.toString();
    }
    return resp;
  }
}

// class StoredData {
//   Future<String> uploadImageTOStorage(String childName, Uint8List file) async {
//     Reference ref = _storage.ref().child(childName);
//     UploadTask uploadTask = ref.putData(file);
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadurl = await snapshot.ref.getDownloadURL();
//     return downloadurl;
//   }
// Future<String> saveData({required Uint8List file}) async {
//     String resp = "Some Error Occurred";
//     try {
//       String imageURL = await uploadImageTOStorage("profileImage", file);
//       String userId = "12345"; // Replace with the current user's ID

//       await _firestore.collection("users").doc(userId).set({
//         "imgUrl": imageURL,
//       });

//       resp = "Data saved successfully";
//     } catch (error) {
//       resp = error.toString();
//     }
//     return resp;
//   }
//    Future<String> fetchData() async {
//     String resp = "Some Error Occurred";
//     try {
//       String userId = "12345"; // Replace with the current user's ID

//       DocumentSnapshot snapshot =
//           await _firestore.collection("users").doc(userId).get();
//       if (snapshot.exists) {
//         Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
//         String imageURL = userData["imgUrl"];
//         resp = "Image URL: $imageURL";
//       } else {
//         resp = "User data not found";
//       }
//     } catch (error) {
//       resp = error.toString();
//     }
//     return resp;
//   }
//   // Future<String> saveData({required Uint8List file}) async {
//   //   String resp = "Some Error Occured";
//   //   try {
//   //    Future<String> imageurl= uploadImageTOStorage("profileImage", file);
//   //   } catch (err) {
//   //     resp = err.toString();
//   //   }
//   //   return resp;
//   // }
// }

class AuthService {
  late final User? firebaseuser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
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
  // update profile and image
}

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
