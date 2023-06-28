import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../sign_up/sign_up_screen.dart';

class Signin extends StatefulWidget {
  static String routeName = '/sign_inemail';
  const Signin({Key? key}) : super(key: key);
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  Icon icon = Icon(Icons.visibility_off);
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
      backgroundColor: Colors.white,
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
                              ? DefaultButtonAnimated(
                                  height: 50,
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

                                      //* if all are valid then go to success screen
                                      await AuthService()
                                          .signInWithEmailAndPassword(
                                              email!, password!, context);
                                    }

                                    setState(() =>
                                        isLoading = false); //animation bool
                                  },
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                        ],
                      )),
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

  Widget buildEmailFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email Address", style: formtextstyle),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormFieldPulse(
          hintText: 'john@email.com',
          icon: const Icon(Icons.person_2_sharp),
          onchanged: (value) {
            if (value!.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
          },
          onsaved: (newValue) => email = newValue,
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
        )
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

          // obscureText: true,
          hintText: '8+ characters required',
          icon: Icon(Icons.lock_outline_sharp),
          onchanged: (value) {
            if (value!.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            return;
          },
          onsaved: (newValue) => password = newValue,
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
        )
      ],
    );
  }
}
