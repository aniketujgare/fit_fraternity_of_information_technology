import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
// import '../../../components/no_account_text.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  // void _resetPassword() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     await _auth.sendPasswordResetEmail(email: email!);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Password reset email sent. Please check your inbox.'),
  //       ),
  //     );
  //   } catch (error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Password reset failed. Please try again.'),
  //       ),
  //     );
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.1),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Please enter your email and we will send \nyou a link to return to your account',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.1),
                const ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

String? email;

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String>? errors = [];
  // String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            children: [
              TextFormFieldPulse(
                keyboardtype: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      errors!.add(kEmailNullError);
                    });
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    setState(() {
                      errors!.add(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                hintText: 'Enter your email',
                icon: Icon(Icons.email),
                onsaved: (newValue) {
                  print('newValue: $newValue');
                  email = newValue;
                },
                // email = newValue, // Add this line
                onchanged: (value) {
                  email = value;
                  if (value!.isNotEmpty && errors!.contains(kEmailNullError)) {
                    setState(() {
                      errors!.remove(kEmailNullError);
                    });
                  } else if (emailValidatorRegExp.hasMatch(value) &&
                      errors!.contains(kInvalidEmailError)) {
                    setState(() {
                      errors!.remove(kInvalidEmailError);
                    });
                  }
                },
              )

              // TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   onSaved: (newValue) => email = newValue,
              //   onChanged: (value) {
              //     if (value.isNotEmpty && errors!.contains(kEmailNullError)) {
              //       setState(() {
              //         errors!.remove(kEmailNullError);
              //       });
              //     } else if (emailValidatorRegExp.hasMatch(value) &&
              //         errors!.contains(kInvalidEmailError)) {
              //       setState(() {
              //         errors!.remove(kInvalidEmailError);
              //       });
              //     }
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       setState(() {
              //         errors!.add(kEmailNullError);
              //       });
              //     } else if (!emailValidatorRegExp.hasMatch(value)) {
              //       setState(() {
              //         errors!.add(kInvalidEmailError);
              //       });
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     errorBorder: InputBorder.none,
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade400)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade400)),
              //     fillColor: Colors.white,
              //     filled: true,
              //     // labelText: 'Email',
              //     hintText: 'Enter your email',
              //     floatingLabelBehavior: FloatingLabelBehavior.always,
              //     suffixIcon: CustomSuffixIcon(
              //       svgIcon: 'assets/icons/Mail.svg',
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors!),
          SizedBox(height: SizeConfig.screenHeight! * 0.05),
          DefaultButton(
            text: 'Reset Password',
            onTap: () async {
              // if (_formKey.currentState!.validate()) {
              //   print('Email: $email');
              //   await FirebaseAuth.instance
              //       .sendPasswordResetEmail(email: email!)
              //       .then((value) {
              //     customSnackBar(context, 'Verification Email has been sent');
              //   });
              //   //* Do Whatever you want to do
              // }
              if (_formKey.currentState!.validate()) {
                print('Email: $email'); // Debug statement
                if (email != null && email!.isNotEmpty) {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email!)
                      .then((value) {
                    customSnackBar(context, 'Verification Email has been sent');
                  });
                  // Do whatever you want to do
                } else {
                  print('Email is empty or null'); // Debug statement
                }
              }
            },
            fontSize: 25,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.1),
        ],
      ),
    );
  }
}
