import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:fit_fraternity_of_information_technology/widget/update_profile_button.dart';
import 'package:flutter/material.dart';

class UpdateUserPage extends StatelessWidget {
  static String routeName = '/update_user';
  const UpdateUserPage({super.key});

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
          'Complete Profile',
          style: textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Color(0xffeceff5)),
                      shape: BoxShape.circle,
                      color: Color(0xffF7F7F7)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.black,
                    ),
                  )),
              Positioned(
                bottom: 10,
                right: 3,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 3, color: const Color(0xffeceff5)),
                      shape: BoxShape.circle,
                      color: const Color(0xffF7F7F7)),
                  child: GestureDetector(
                    onTap: () {
                      // _onImageButtonPressed(ImageSource.gallery,
                      //     context: context);
                    },
                    child:
                        const Icon(Icons.edit, size: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 37,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldPulsee(
            hintText: 'Name',
            icon: const Icon(Icons.person),
            // textFieldController: null,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldPulsee(
            hintText: 'PRN',
            icon: const Icon(Icons.person),
            // textFieldController: null,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldPulsee(
            hintText: 'Date of Birth',
            icon: const Icon(Icons.person),
            // textFieldController: null,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldPulsee(
            hintText: 'Year Of Graduation',
            icon: const Icon(Icons.person),
            // textFieldController: null,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldPulsee(
            hintText: 'Year Of Graduation',
            icon: const Icon(Icons.person),
            // textFieldController: null,
          ),
          const SizedBox(
            height: 25,
          ),
          FitPulseButton(
            fontSize: 16,
            height: 55,
            // showArrow: false,
            hMargin: 0,
            onTap: () {},
            text: 'Save',
          )
        ]),
      ),
    );
  }
}

class TextFormFieldPulsee extends StatelessWidget {
  final String hintText;
  final Widget icon;
  // final TextEditingController textFieldController;
  const TextFormFieldPulsee({
    super.key,
    required this.hintText,
    required this.icon,
    // required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      // controller: textFieldController,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: const Color(0xffADB6C1),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 20, minWidth: 50),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffADB6C1),
        ),
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        focusColor: const Color(0xfff8f8f8),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffeceff5)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffeceff5)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
