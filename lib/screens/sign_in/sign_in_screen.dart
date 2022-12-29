import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign In',
        ),
      ),
      body: const Body(),
    );
  }
}
