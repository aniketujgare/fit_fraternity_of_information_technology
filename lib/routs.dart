// import 'dart:js';

import 'package:fit_fraternity_of_information_technology/main.dart';
import 'package:fit_fraternity_of_information_technology/page/change_password.dart';
import 'package:fit_fraternity_of_information_technology/page/image_picker.dart';
import 'package:fit_fraternity_of_information_technology/page/update_user_page.dart';
import 'package:fit_fraternity_of_information_technology/page/user_page.dart';
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
  UpdateUserPage.routeName: (context) => const UpdateUserPage(),
<<<<<<< HEAD
  PaymentMembership.routeName: (context) => const PaymentMembership(),
=======
  ChangePassword.routeName: (context) => ChangePassword()
>>>>>>> 3e83f087b1dd3e2dca46a2964e140c3c2e3e38ae

  // SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  // HomeScreen.routName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
  // RoleChoose.routeName: (context) => RoleChoose(),
  // SignUpSellerScreen.routeName: (context) => SignUpSellerScreen(),
  // FeedsScreen.routeName: (context) => FeedsScreen(),
  // SellerDashboardScreen.routName: (context) => SellerDashboardScreen(),
  // SignInSellerScreen.routeName: (context) => SignInSellerScreen(),
  // ProductAddForm.routName: (context) => ProductAddForm(),
  // RestaurantBookingHomeScreen.routName: (context) =>
  //     RestaurantBookingHomeScreen(),
  // Profile.routName: (context) => Profile()
};
