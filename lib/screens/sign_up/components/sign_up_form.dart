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
                ? DefaultButtonAnimated(press: () {})
                : DefaultButton(
                    text: 'SIGN UP',
                    press: () async {
                      //set animate bool
                      if (isLoading) return;
                      setState(() => isLoading = true);
                      //set animate bool

                      if (_formKey.currentState!.validate()) {
                        //* GO to complete profile page
                        await AuthService().registerInWithEmailAndPassword(
                            email!, password!, mobile!, name!, context);

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

  // TextFormField buildConfPasswordPasswordFormField() {
  //   return TextFormField(
  //     obscureText: true,
  //     onSaved: (newValue) => confirmPassword = newValue,
  //     onChanged: (value) {
  //       if (password == confirmPassword) {
  //         removeError(error: kMatchPassError);
  //       }
  //       return;
  //     },
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //       } else if (password != value) {
  //         addError(error: kMatchPassError);
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       errorBorder: InputBorder.none,
  //       enabledBorder: const OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.white)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.grey.shade400)),
  //       fillColor: Colors.grey.shade200,
  //       filled: true,
  //       labelText: 'Connfirm Password',
  //       hintText: 'Re-Enter your password',
  //       // floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSuffixIcon(
  //         svgIcon: 'assets/icons/Lock.svg',
  //       ),
  //     ),
  //   );
  // }

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
            password = value;
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
            // fillColor: Colors.grey.shade200,
            fillColor: Colors.white,
            filled: true,
            // labelText: 'Password',
            hintText: '8+ characters required',
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            // suffixIcon: Icon(Icons.abc_outlined)
            // CustomSuffixIcon(
            //   svgIcon: 'assets/icons/Lock.svg',
            // ),
          ),
        ),
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
            email = value;
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
            // floatingLabelBehavior: FloatingLabelBehavior.always,/
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          ),
        ),
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
        TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => mobile = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              // return '';
              // } else if (!emailValidatorRegExp.hasMatch(value)) {
              //   addError(error: kInvalidEmailError);
              //   // return '';
            }
            mobile = value;
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
            // labelText: 'mobie',
            hintText: 'Enter your mobile',
            // floatingLabelBehavior: FloatingLabelBehavior.always,/
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          ),
        ),
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
        TextFormField(
          keyboardType: TextInputType.name,
          onSaved: (newValue) => name = newValue,
          onChanged: (value) {
            // if (value.isNotEmpty) {
            //   removeError(error: kEmailNullError);
            // } else if (emailValidatorRegExp.hasMatch(value)) {
            //   removeError(error: kInvalidEmailError);
            // }
          },
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     addError(error: kEmailNullError);
          //     // return '';
          //   // } else if (!emailValidatorRegExp.hasMatch(value)) {
          //   //   addError(error: kInvalidEmailError);
          //   //   // return '';
          //   }
          //   name = value;
          //   return null;
          // },
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.white,
            filled: true,
            // labelText: 'Name',
            hintText: '@ john',
            // floatingLabelBehavior: FloatingLabelBehavior.always,/
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          ),
        ),
      ],
    );
  }
}
