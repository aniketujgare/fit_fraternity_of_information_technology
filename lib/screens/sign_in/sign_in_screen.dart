import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import '../../size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  static String verify = '';
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign In',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(35),
            ),
            TextField(
              // controller: myController,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                myController.text = value;
                print(myController.text);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone",
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(35),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(45),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.aquaSplash,
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  // ignore: avoid_print
                  print(myController.text);
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${myController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      verify = verificationId;
                      Navigator.pushNamed(context, OTPScreen.routeName);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: const Text(
                  "Send OTP",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
