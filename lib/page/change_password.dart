import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/update_user_page.dart';
import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:fit_fraternity_of_information_technology/services/auth.dart';
import 'package:fit_fraternity_of_information_technology/widget/update_profile_button.dart';
import 'package:flutter/material.dart';

import '../components/default_button.dart';
import '../size_config.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = '/change_password';
  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String? oldPassword, newPassword1, newPassword2;
  List<String>? errors = [];
  bool isLoading = false; //spin button
  var auth = FirebaseAuth.instance;
  // var currentUser = FirebaseAuth.instance.currentUser;
  ChangePassword({email, oldPassword, newPassword1}) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword1);
    }).catchError((errors) {
      print(errors.toString());
    });
  }

  void addError({String? error}) {
    if (!errors!.contains(error)) {
      setState(() {
        errors!.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors!.contains(error)) {
      setState(() {
        errors!.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
          style: textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormFieldPulse(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: kPassNullError);
                        // return '';
                      } else if (value.length < 8) {
                        addError(error: kShortPassError);
                        // return '';
                      }
                      return null;
                    },
                    onchanged: (value) {
                      if (value!.isNotEmpty) {
                        removeError(error: kPassNullError);
                      } else if (value.length >= 8) {
                        removeError(error: kShortPassError);
                      }
                      return;
                    },
                    onsaved: (newValue) => oldPassword = newValue,
                    hintText: 'Current Password',
                    icon: const Icon(Icons.person),
                    // textFieldController: null,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormFieldPulse(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: kPassNullError);
                        // return '';
                      } else if (value.length < 8) {
                        addError(error: kShortPassError);
                        // return '';
                      }
                      return null;
                    },
                    onchanged: (value) {
                      if (value!.isNotEmpty) {
                        removeError(error: kPassNullError);
                      } else if (value.length >= 8) {
                        removeError(error: kShortPassError);
                      }
                      return;
                    },
                    onsaved: (newValue) => newPassword1 = newValue,
                    hintText: 'New Password',
                    icon: const Icon(Icons.person),
                    // textFieldController: null,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormFieldPulse(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(error: kPassNullError);
                        // return '';
                      } else if (value.length < 8) {
                        addError(error: kShortPassError);
                        // return '';
                      }
                      return null;
                    },
                    onchanged: (value) {
                      if (value!.isNotEmpty) {
                        removeError(error: kPassNullError);
                      } else if (value.length >= 8) {
                        removeError(error: kShortPassError);
                      }
                      return;
                    },
                    onsaved: (newValue) => newPassword2 = newValue,
                    hintText: 'New Password',
                    icon: const Icon(Icons.person),
                    // textFieldController: null,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  isLoading
                      ? DefaultButtonAnimated(
                          ontap: () {},
                          fontSize: 20,
                        )
                      : DefaultButton(
                          height: 50,
                          text: 'Continue',
                          onTap: () async {
                            //set animate bool
                            if (isLoading) return;
                            setState(() => isLoading = true);

                            //set animate bool

                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              ChangePassword(
                                  email: 19,
                                  oldPassword: oldPassword,
                                  newPassword1: newPassword1);
                              //* if all are valid then go to success screen
                            }

                            setState(() => isLoading = false); //animation bool
                          },
                          fontSize: getProportionateScreenWidth(18),
                        ),
                  // FitPulseButton(
                  //   fontSize: 16,
                  //   height: 55,
                  //   // showArrow: false,
                  //   hMargin: 0,
                  //   onTap: () {},
                  //   text: 'Update Password',
                  // )
                ]),
          ),
        ),
      ),
    );
  }
}

// class TextFormFieldPulsee extends StatelessWidget {
//   final String hintText;
//   final Widget icon;
//   // final TextEditingController textFieldController;
//   const TextFormFieldPulsee({
//     super.key,
//     required this.hintText,
//     required this.icon,
//     // required this.textFieldController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: const TextStyle(color: Colors.black),
//       // controller: textFieldController,
//       textAlign: TextAlign.start,
//       decoration: InputDecoration(
//         prefixIcon: icon,
//         prefixIconColor: const Color(0xffADB6C1),
//         prefixIconConstraints:
//             const BoxConstraints(minHeight: 20, minWidth: 50),
//         hintText: hintText,
//         hintStyle: const TextStyle(
//           color: Color(0xffADB6C1),
//         ),
//         filled: true,
//         fillColor: const Color(0xffF7F7F7),
//         focusColor: const Color(0xfff8f8f8),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xffeceff5)),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xffeceff5)),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }
