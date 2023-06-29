import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../size_config.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obscure = true;
  Icon icon = Icon(Icons.visibility_off);
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
      currentUser.updatePassword(newPassword1);
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
        // automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // GestureDetector(f(context).pop(),
        //     child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        backgroundColor: Colors.white,
        title: Text(
          textAlign: TextAlign.left,
          'Back',
          style: textStyle.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text("Create New Password",
                  style: textStyle.copyWith(fontSize: 27)),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Your new password must be different from previous used passwords.",
                  style: textStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal)),
              Form(
                key: _formKey,
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
                        obscureText: obscure,
                        suffixIcon: IconButton(
                            color: Colors.black,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                                if (obscure) {
                                  icon = Icon(Icons.visibility_off);
                                } else {
                                  icon = Icon(Icons.visibility);
                                }
                              });
                            },
                            icon: icon),
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
                        icon: const Icon(Icons.lock_open_sharp),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormFieldPulse(
                        obscureText: obscure,
                        suffixIcon: IconButton(
                            color: Colors.black,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                                if (obscure) {
                                  icon = Icon(Icons.visibility_off);
                                } else {
                                  icon = Icon(Icons.visibility);
                                }
                              });
                            },
                            icon: icon),
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
                        icon: const Icon(Icons.lock_outline_sharp),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormFieldPulse(
                        obscureText: true,
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
                        icon: const Icon(Icons.lock_outline_sharp),
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
                              text: 'Reset Password',
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

                                setState(
                                    () => isLoading = false); //animation bool
                              },
                              fontSize: getProportionateScreenWidth(18),
                            ),
                      SizedBox(
                        height: 15,
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
            ],
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
