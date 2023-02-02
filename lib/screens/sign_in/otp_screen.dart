import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import '../../main.dart';
import '../../size_config.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = '/otp';

  const OTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var otpController = TextEditingController();
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
              controller: otpController,
              keyboardType: TextInputType.phone,
              onSubmitted: (value) => otpController.text = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "OTP",
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
                  // Create a PhoneAuthCredential with the code
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: SignInScreen.verify,
                      smsCode: otpController.text);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential).then((value) {
                    if (value.user != null) {
                      // print("Sign in the uer with id" + value.user.toString());
                      Navigator.pushNamedAndRemoveUntil(
                          context, MyHomePage.routeName, (route) => false);
                    }
                  });
                },
                child: const Text(
                  "Verify OTP",
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
