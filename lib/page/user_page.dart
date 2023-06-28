import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/aboutfit.dart';
import 'package:fit_fraternity_of_information_technology/page/change_password.dart';
import 'package:fit_fraternity_of_information_technology/page/help.dart';
import 'package:fit_fraternity_of_information_technology/page/update_user_page.dart';
import 'package:fit_fraternity_of_information_technology/page/user_changepassword.dart';
import 'package:fit_fraternity_of_information_technology/payment_membership.dart';
import 'package:fit_fraternity_of_information_technology/services/auth.dart';
import 'package:flutter/material.dart';
import '../screens/sign_in/sign_in.dart';
import '../size_config.dart';
import '../wall/news_page.dart';
import '../widget/update_profile_button.dart';

class UserPage extends StatelessWidget {
  static String routeName = '/User_page';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    SizeConfig().init(context);
    final currentuser = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      // backgroundColor: const Color(0xffF7F7F7),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500),
        ),
        // backgroundColor: Color(0xffF7F7F7),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, UpdateUserPage.routeName),
              icon: const Icon(
                Icons.border_color,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Signin.routeName, (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22)),
          child: FutureBuilder(
              future: getUserDetails(currentuser.email.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  UserModel? userdata = snapshot.data as UserModel;
                  return Column(children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/fraternity-of-information-tech.appspot.com/o/user_profile%2Ftushar.jpg?alt=media&token=908b55e8-d0f1-42f3-ab8f-0daaf5e1748b"),
                      radius: 70,
                    ),
                    RichText(
                      text: TextSpan(
                          text: userdata.name ?? "",
                          style: textStyle.copyWith(
                              color: Colors.black, fontSize: 25)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 15, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      height: getProportionateScreenHeight(170),
                      width: getProportionateScreenWidth(330),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                      child: Text(
                                    userdata.email ?? "",
                                    textAlign: TextAlign.end,
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.black),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date of Birth:",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      userdata.dateofbirth ?? "_",
                                      // userdata.email ?? "",

                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.black),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "PRN:",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      userdata.prn ?? "",
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 15, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(330),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.wallet_membership,
                                      color: Colors.red),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "MemberShip",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        color: Colors.black,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        alignment: Alignment.topRight,
                                        onPressed: () => Navigator.pushNamed(
                                            context,
                                            PaymentMembership.routeName),
                                        icon: Icon(Icons.arrow_forward_ios)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 15, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      height: getProportionateScreenHeight(170),
                      width: getProportionateScreenWidth(330),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.lock, color: Colors.red),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        color: Colors.black,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        alignment: Alignment.topRight,
                                        onPressed: () => Navigator.pushNamed(
                                            context,
                                            ChangeUserPassword.routeName),
                                        icon: Icon(Icons.arrow_forward_ios)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.black),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.help, color: Colors.green),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Help",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                      child: IconButton(
                                    color: Colors.black,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    alignment: Alignment.centerRight,
                                    onPressed: () => Navigator.pushNamed(
                                        context, HelpScreen.routeName),
                                    icon: Icon(Icons.arrow_forward_ios),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.black),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.app_settings_alt_outlined,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "About FIT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                      child: IconButton(
                                    color: Colors.black,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    alignment: Alignment.centerRight,
                                    icon: Icon(Icons.arrow_forward_ios),
                                    onPressed: () => Navigator.pushNamed(
                                        context, Aboutfit.routeName),
                                  ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else
                  return Text("_");
              }),
        ),
      ),
    );
  }
}
