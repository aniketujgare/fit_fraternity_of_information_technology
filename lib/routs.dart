// import 'dart:js';

import 'package:fit_fraternity_of_information_technology/main.dart';
import 'package:fit_fraternity_of_information_technology/page/user/aboutfit.dart';
import 'package:fit_fraternity_of_information_technology/page/user/change_password.dart';
import 'package:fit_fraternity_of_information_technology/page/user/help.dart';
import 'package:fit_fraternity_of_information_technology/page/image/image_picker.dart';
import 'package:fit_fraternity_of_information_technology/page/user/update_user_page.dart';
import 'package:fit_fraternity_of_information_technology/page/user/user_changepassword.dart';
import 'package:fit_fraternity_of_information_technology/page/user/user_page.dart';
import 'package:fit_fraternity_of_information_technology/payment_membership.dart';
import 'package:fit_fraternity_of_information_technology/screens/forgot_password/forgot_password_screen.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/sign_in.dart';
// import 'package:fit_fraternity_of_information_technology/screens/sign_in/otp_screen.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_out/sign_out_screen.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

// import 'screens/sign_in/sign_in_screen.dart';

// Using name route, all our routes will be available here

final Map<String, WidgetBuilder> routes = {
  // ImagePickerPage.routeName: (context) => const ImagePickerPage(),
  Signin.routeName: (context) => const Signin(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SignOutScreen.routeName: (context) => const SignOutScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),
  UserPage.routeName: (context) => const UserPage(),
  UpdateUserPage.routeName: (context) => UpdateUserPage(),
  PaymentMembership.routeName: (context) => const PaymentMembership(),
  Aboutfit.routeName: (context) => const Aboutfit(),
  ChangeUserPassword.routeName: (context) => const ChangeUserPassword(),
  HelpScreen.routeName: (context) => HelpScreen(),
};
