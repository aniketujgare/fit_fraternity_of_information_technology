import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
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
  String? mobile;
  String? password;
  String? name;
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
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildnameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildMobileFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // Text("Email"),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildConfPasswordPasswordFormField(),

            FormError(errors: errors!),
            SizedBox(height: getProportionateScreenHeight(40)),
            isLoading
                ? DefaultButtonAnimated(
                    ontap: () {},
                    fontSize: 20,
                  )
                : DefaultButton(
                    text: 'SIGN UP',
                    onTap: () async {
                      //set animate bool
                      if (isLoading) return;
                      setState(() => isLoading = true);
                      //set animate bool

                      if (_formKey.currentState!.validate()) {
                        //* GO to complete profile page
                        await AuthService().registerInWithEmailAndPassword(
                            // "tushar",
                            // "78757386666",
                            // "tugshihhnde@gmail.com",
                            // "tushar425",

                            name!,
                            mobile!,
                            email!,
                            password!,
                            context);

                        // await FirebaseFirestore.instance
                        //     .collection('users')
                        //     .doc(user!.uid)
                        //     .set({'firstName': email});
                        // Navigator.pushNamed(
                        //     context, CompleteProfileScreen.routeName);
                      }
                      setState(() => isLoading = false); //animation bool
                    },
                    fontSize: 25,
                  ),
          ],
        ));
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
          obscureText: true,
          hintText: '8+ characters required',
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
          icon: Icon(Icons.password),
          onsaved: (newValue) => password = newValue,
          onchanged: (value) {
            if (value!.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            password = value;
            return;
          },
        )
      ],
    );
  }

  Widget buildEmailFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email Address",
          style: formtextstyle,
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormFieldPulse(
          keyboardtype: TextInputType.emailAddress,
          hintText: 'john@email.com',
          icon: Icon(Icons.email),
          onsaved: (newValue) => email = newValue,
          onchanged: (value) {
            if (value!.isNotEmpty) {
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
            email = value;
            return null;
          },
        )
      ],
    );
  }

  Widget buildMobileFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone No",
          style: formtextstyle,
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormFieldPulse(
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: kPhoneNumberNullError);
            }
            mobile = value;
            return null;
          },
          keyboardtype: TextInputType.phone,
          hintText: 'Enter your mobile',
          icon: Icon(Icons.phone_enabled_outlined),
          onsaved: (newValue) => mobile = newValue,
          onchanged: (value) {
            if (value!.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
          },
        )
      ],
    );
  }

  Widget buildnameFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Name",
          style: formtextstyle,
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormFieldPulse(
          hintText: 'john',
          icon: Icon(Icons.person_2_sharp),
          onsaved: (newValue) => name = newValue,
          onchanged: (value) {
            name = value;
          },
        )
      ],
    );
  }
}
