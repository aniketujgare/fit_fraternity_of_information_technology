import 'package:flutter/material.dart';
import '../../components/social_card.dart';
import '../../services/auth.dart';
import '../../size_config.dart';

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
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.04),
                  Text(
                    'Will see you soon',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Sign out from the app \nhope to catch you later',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.08),
                  TextButton(
                      onPressed: () {
                        AuthService().signOut(context);
                      },
                      child: const Text('Sing Out !')),
                  SizedBox(height: SizeConfig.screenHeight! * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: 'assets/icons/google-icon.svg',
                        press: () {},
                      ),
                      SocialCard(
                        icon: 'assets/icons/facebook-2.svg',
                        press: () {},
                      ),
                      SocialCard(
                        icon: 'assets/icons/twitter.svg',
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
