import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../sign_up/sign_up_screen.dart';

class SignForm extends StatefulWidget {
  static String routeName = '/sign_inemail';
  const SignForm({Key? key}) : super(key: key);
  @override
  
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String? email, password;
  List<String>? errors = [];

  bool isLoading = false; //spin button

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
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("vfvfvvfvvf"),
      // ),
      // body: Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(35)),
                  Icon(
                    Icons.lock,
                    size: getProportionateScreenHeight(100),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildEmailFormField(),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          buildPasswordFormField(),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, ForgotPasswordScreen.routeName),
                                child: const Text(
                                  'Recovery Password',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          FormError(
                            errors: errors!,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          isLoading
                              ? DefaultButtonAnimated(press: () {})
                              : DefaultButton(
                                  text: 'Continue',
                                  press: () async {
                                    //set animate bool
                                    if (isLoading) return;
                                    setState(() => isLoading = true);

                                    //set animate bool

                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      //* if all are valid then go to success screen
                                      await AuthService()
                                          .signInWithEmailAndPassword(
                                              email!, password!, context);
                                    }

                                    setState(() =>
                                        isLoading = false); //animation bool
                                  }),
                        ],
                      )),
                  // SizedBox(height: SizeConfig.screenHeight! * 0.18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Form(
//     key: _formKey,
//     child: Column(
//       children: [
//         buildEmailFormField(),
//         SizedBox(
//           height: getProportionateScreenHeight(30),
//         ),
//         buildPasswordFormField(),
//         SizedBox(
//           height: getProportionateScreenHeight(30),
//         ),
//         Row(
//           children: [
//             Checkbox(
//                 checkColor: kPrimaryColor,
//                 value: remember,
//                 onChanged: (value) {
//                   setState(() {
//                     remember = value!;
//                   });
//                 }),
//             const Text('Remember me'),
//             const Spacer(),
//             GestureDetector(
//               onTap: () => Navigator.popAndPushNamed(
//                   context, ForgotPasswordScreen.routeName),
//               child: const Text(
//                 'Forgot Password',
//                 style: TextStyle(decoration: TextDecoration.underline),
//               ),
//             ),
//           ],
//         ),
//         FormError(
//           errors: errors!,
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(20),
//         ),
//         isLoading
//             ? DefaultButtonAnimated(press: () {})
//             : DefaultButton(
//                 text: 'Continue',
//                 press: () async {
//                   //set animate bool
//                   if (isLoading) return;
//                   setState(() => isLoading = true);

//                   //set animate bool

//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();

//                     //* if all are valid then go to success screen
//                     await AuthService().signInWithEmailAndPassword(
//                         email!, password!, context);
//                   }

//                   setState(() => isLoading = false); //animation bool
//                 }),
//       ],
//     ),
//   );
// }

  Widget buildEmailFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email Address", style: formtextstyle),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: kEmailNullError);
              // return '';
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              addError(error: kInvalidEmailError);
              // return '';
            }
            return null;
          },
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.white,
            filled: true,
            // labelText: 'Email',
            hintText: 'john@email.com',
            hintStyle: TextStyle(color: Colors.grey[500]),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: formtextstyle,
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            return;
          },
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
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.white,
            filled: true,
            // labelText: 'Password',
            hintText: '8+ characters required',
            hintStyle: TextStyle(color: Colors.grey[500]),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: 'assets/icons/Lock.svg',
            ),
          ),
        ),
      ],
    );
  }
}
