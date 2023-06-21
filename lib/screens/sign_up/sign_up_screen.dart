import 'package:fit_fraternity_of_information_technology/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';
import 'package:fit_fraternity_of_information_technology/size_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Body(),
      ),
    );
  }
}
