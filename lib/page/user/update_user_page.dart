import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/user/utils.dart';
import 'package:fit_fraternity_of_information_technology/screens/widget/textformfield.dart';
import 'package:fit_fraternity_of_information_technology/widget/update_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/auth.dart';

// ignore: must_be_immutable
class UpdateUserPage extends StatefulWidget {
  static String routeName = '/update_user';
  UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  Uint8List? _iamge;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _iamge = img;
    });
  }

  Future<Uint8List?> getImageFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      return bytes;
    } else {
      return null;
    }
  }
  // Future<Uint8List?> getImageFile() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     return bytes;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final currentuser = FirebaseAuth.instance.currentUser!;
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
        child: FutureBuilder(
            future:
                // getUserda
                getUserDetails(currentuser.email.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                UserModel? userdata = snapshot.data;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4, color: Color(0xffeceff5)),
                                  shape: BoxShape.circle,
                                  color: Color(0xffF7F7F7)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _iamge != null
                                      ? CircleAvatar(
                                          backgroundImage: MemoryImage(_iamge!),
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.person,
                                            size: 90,
                                            color: Colors.black,
                                          ),
                                        )
                                  // CircleAvatar(backgroundColor: Colors.black),
                                  // child: Icon(
                                  //   Icons.person,
                                  //   size: 90,
                                  //   color: Colors.black,
                                  // ),
                                  )),
                          Positioned(
                            bottom: 10,
                            right: 3,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: const Color(0xffeceff5)),
                                  shape: BoxShape.circle,
                                  color: const Color(0xffF7F7F7)),
                              child: GestureDetector(
                                onTap: selectImage
                                // () {
                                // _onImageButtonPressed(ImageSource.gallery,
                                //     context: context);
                                // }
                                ,
                                child: const Icon(Icons.edit,
                                    size: 20, color: Colors.black),
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
                      TextFormFieldPulse(
                        initialValue: userdata?.name ?? "",
                        hintText: 'Name',
                        icon: const Icon(Icons.person_2_sharp),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormFieldPulse(
                        initialValue: userdata?.prn,
                        hintText: 'PRN',
                        icon: const Icon(Icons.numbers_sharp),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormFieldPulse(
                        initialValue: userdata!.mobile,
                        hintText: 'Enter your mobile',
                        icon: const Icon(Icons.local_phone_outlined),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormFieldPulse(
                        initialValue: userdata!.dateofbirth,
                        hintText: 'Date of Birth',
                        icon: const Icon(Icons.date_range),
                        // textFieldController: null,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FitPulseButton(
                        fontSize: 16,
                        height: 55,
                        hMargin: 0,
                        onTap: () async {
                          // Get the image file, replace `getImageFile()` with your own method to retrieve the image file
                          // Uint8List? imageFile = await getImageFile();

                          // if (imageFile != null) {
                          //   String response =
                          //       await StoredData().saveData(file: imageFile);
                          //   print(response);
                          // } else {
                          //   print("Image file not selected");
                          // }
                        },
                        text: 'Save',
                      )
                    ]);
              } else if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              } else
                return Text("_");
            }),
      ),
    );
  }
}
