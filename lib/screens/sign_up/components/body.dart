import 'package:fit_fraternity_of_information_technology/screens/sign_in/components/sign_form.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import '../../../components/social_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
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
                  height:
                      SizeConfig.screenHeight! * 0.03), // 8% of total height
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.09),

              // Text(
              //   'By continuing your confirm that you agree\nwith our Term and Condition',
              //   textAlign: TextAlign.center,
              // )

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an account?",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignForm.routeName);
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
    );
  }
}
