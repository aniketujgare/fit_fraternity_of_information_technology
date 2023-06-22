import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_config.dart';

const kPrimaryColor = Colors.blue;
const kPrimaryLightColor = Color(0xFF0072BB);
const kUiBlackColor = Color(0xff2C294A);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
const textStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w500);

final headingStyle = GoogleFonts.bebasNeue(
  fontSize: getProportionateScreenWidth(28),
  color: Colors.black,
);
final formtextstyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final RegExp emailPattern =
    RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$");

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

void showActionSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      'Verification Email has been sent!',
      style: TextStyle(
          fontSize: getProportionateScreenWidth(18), color: Colors.white),
    ),
    backgroundColor: kPrimaryColor,
    // shape: ,
    // margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    elevation: 2,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

ScaffoldFeatureController customSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: getProportionateScreenWidth(16)),
    ),
    backgroundColor: kPrimaryColor,
    shape: const StadiumBorder(),
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    // 'Verification Email has been sent!'
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

MaterialBanner customMaterialBanner(BuildContext context) {
  return MaterialBanner(
    // padding: EdgeInsets.all(10),
    content: const Text(
      'Verify your account, link has been sent to Email',
      style: TextStyle(color: Colors.white),
    ),
    leading: const Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
    backgroundColor: kPrimaryColor,
    actions: <Widget>[
      TextButton(
        onPressed: () async {
          // User? userCredential = FirebaseAuth.instance.currentUser;

          // if (userCredential != null && !userCredential.emailVerified) {
          //   await userCredential.sendEmailVerification();
          // }
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
        style: TextButton.styleFrom(backgroundColor: Colors.white),
        child: const Text(
          'Re-sent',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
        style: TextButton.styleFrom(backgroundColor: Colors.white),
        child: const Text(
          'Dismiss',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    ],
  );
}

//default button style
final defButtonStyle =
    TextStyle(fontSize: getProportionateScreenWidth(18), color: Colors.white);

// List<String> kCategory = [
//   'Electronics',
//   'Fashion',
//   'Home',
//   'Beauty',
//   'Appliances',
//   'Toys & Baby',
//   'Food',
//   'Sports'
// ];

// Map<String, List<String>> kCatAndSubcat = {
//   'Fashion': ['jeans', 'jogger'],
//   'Electronics': ['mobiles', 'pendrive', 'refrigerator'],
//   'Food': ['juice', 'fruits', 'jam'],
//   'Printers': ['Pixma', 'InkJet', 'LaserJet'],
// };

// String price(num amount) {
//   return '${NumberFormat.simpleCurrency(locale: 'gu').format(amount).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '')}';
// }

final Map<String, int> kDateToInt = {
  'Jan': 1,
  'Feb': 2,
  'Mar': 3,
  'Apr': 4,
  'May': 5,
  'Jun': 6,
  'Jul': 7,
  'Aug': 8,
  'Sep': 9,
  'Oct': 10,
  'Nov': 11,
  'Dec': 12,
};
