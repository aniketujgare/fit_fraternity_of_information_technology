import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  final List<String>? errors = [];
  bool isLoading = false; // button animation
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
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConfPasswordPasswordFormField(),
            FormError(errors: errors!),
            SizedBox(height: getProportionateScreenHeight(40)),
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
                        //* GO to complete profile page
                        await AuthService().registerInWithEmailAndPassword(
                            email!, password!, context);

                        // await FirebaseFirestore.instance
                        //     .collection('users')
                        //     .doc(user!.uid)
                        //     .set({'firstName': email});
                        // Navigator.pushNamed(
                        //     context, CompleteProfileScreen.routeName);

                      }
                      setState(() => isLoading = false); //animation bool
                    }),
          ],
        ));
  }

  TextFormField buildConfPasswordPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        return;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        } else if (password != value) {
          addError(error: kMatchPassError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Connfirm Password',
        hintText: 'Re-Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        email = value;
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
