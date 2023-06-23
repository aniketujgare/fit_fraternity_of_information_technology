import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  // String? dateofbirth;
  String? prn;
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

  // @override
  // void initState() {
  //   dateofbirth = ""; //set the initial value of text field
  //   super.initState();
  // }

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
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPRNFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildDateFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildConfPasswordPasswordFormField(),

            FormError(errors: errors!),
            SizedBox(height: getProportionateScreenHeight(10)),
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
                        // final user UserModel(email:email);
                        //* GO to complete profile page
                        await AuthService().registerInWithEmailAndPassword(
                            // "tushar",
                            // "78757386666",
                            // "tugshihhnde@gmail.com",
                            // "tushar425",

                            name!,
                            // "7875738666",
                            mobile!,
                            email!,
                            prn!,
                            password!,
                            // dateofbirth!,
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

  Widget buildPRNFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PRN",
          style: formtextstyle,
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        TextFormFieldPulse(
          validator: (value) {
            if (value == null || value.isEmpty) {
              addError(error: kPhoneNumberNullError);
            }
            prn = value;
            return null;
          },
          keyboardtype: TextInputType.phone,
          hintText: 'Enter your PRN',
          icon: Icon(Icons.numbers_sharp),
          onsaved: (newValue) => prn = newValue,
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

  // Widget buildDateFormField() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Date of Birth",
  //         style: formtextstyle,
  //       ),
  //       SizedBox(height: getProportionateScreenHeight(8)),
  //       TextFormFieldPulse(
  //         initialValue: dateofbirth,
  //         readOnly: true,
  //         onTap: () async {
  //           DateTime? pickDate = await showDatePicker(
  //               context: context,
  //               initialDate: DateTime.now(),
  //               firstDate: DateTime(2000),
  //               lastDate: DateTime(2100));
  //           if (pickDate != null) {
  //             print(
  //                 pickDate); //pickedDate output format => 2021-03-10 00:00:00.000
  //             String formattedDate = DateFormat('yyyy-MM-dd').format(pickDate);
  //             print(
  //                 formattedDate); //formatted date output using intl package =>  2021-03-16
  //             //you can implement different kind of Date Format here according to your requirement

  //             setState(() {
  //               dateofbirth =
  //                   formattedDate; //set output date to TextField value.
  //             });
  //           } else {
  //             print("Date is not selected");
  //           }
  //         },
  //         // keyboardtype: TextInputType.phone,
  //         hintText: 'Enter your Date of Birth',
  //         icon: Icon(Icons.numbers_sharp),
  //         // onsaved: (){},
  //         // (newValue) => dateofbirth = newValue!,
  //         // onchanged: (value) {
  //         //   // if (value!.isNotEmpty) {
  //         //   //   removeError(error: kEmailNullError);
  //         //   // } else if (emailValidatorRegExp.hasMatch(value)) {
  //         //   //   removeError(error: kInvalidEmailError);
  //         //   // }
  //         // },
  //       )
  //     ],
  //   );
  // }

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
