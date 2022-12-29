import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';

class SignOutScreen extends StatelessWidget {
  static String routeName = '/sign_out';

  const SignOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign Out',
        ),
      ),
      body: const Body(),
    );
  }
}
