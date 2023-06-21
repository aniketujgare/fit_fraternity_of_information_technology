import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FitPulseButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor, textColor;
  final double tMargin, bMargin, hMargin;
  final double height;
  final double fontSize;
  final bool showArrow, showUpload, border;
  const FitPulseButton({
    super.key,
    required this.onTap,
    required this.text,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.tMargin = 0,
    this.bMargin = 0,
    this.height = 40,
    this.hMargin = 25,
    this.showArrow = true,
    this.showUpload = false,
    this.border = false,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: hMargin, right: hMargin, top: tMargin, bottom: bMargin),
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(35),
          border: border ? Border.all(color: Colors.black) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
                if (showArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ],
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
}

Stream<String> getUserStream() async* {
  yield await getuser();
}

String getCurrentUserEmail() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;

  if (user != null) {
    final String email = user.email ?? '';
    return email;
  } else {
    // User is not signed in
    return '';
  }
}
