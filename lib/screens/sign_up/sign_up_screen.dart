// import 'package:fit_fraternity_of_information_technology/screens/sign_up/components/body.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_up/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:fit_fraternity_of_information_technology/size_config.dart';

import '../../constants.dart';
import '../forgot_password/components/body.dart';
import '../sign_in/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    Text(
                      'Hi, Welcome Back!',
                      style: headingStyle,
                    ),
                    const Text(
                      'Register below with your details!',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                        height: SizeConfig.screenHeight! *
                            0.03), // 8% of total height
                    SignUpForm(),
                    // Flex(direction: Axis.vertical, children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.013),
                    // ]),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an account?",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Signin.routeName);
                          },
                          child: Text(
                            "SIGN IN ",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(18),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
