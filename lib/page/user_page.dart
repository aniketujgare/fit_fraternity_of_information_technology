import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/change_password.dart';
import 'package:fit_fraternity_of_information_technology/page/update_user_page.dart';
import 'package:flutter/material.dart';
import '../screens/sign_in/sign_in.dart';
import '../size_config.dart';
import '../widget/update_profile_button.dart';

class UserPage extends StatelessWidget {
  static String routeName = '/User_page';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    SizeConfig().init(context);
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
          child: Column(children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1630568667432-0fa3609f0a32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"),
              radius: 70,
              // child: Icon(
              // // Icons.person,
              // size: 90,
              // color: Colors.black,
              // ),
            ),
            StreamBuilder<String>(
              stream: getUserStream(),
              builder: (context, snapshot) {
                return RichText(
                  text: TextSpan(
                      text: snapshot.hasData ? ' ${snapshot.data} ' : '',
                      style: textStyle.copyWith(
                          color: Colors.black, fontSize: 25)),
                );
              },
            ),
            // RichText(
            //     text: TextSpan(
            //         text: 'Tushar',
            //         style:
            //             textStyle.copyWith(color: Colors.black, fontSize: 25))),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 15, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white),
              height: getProportionateScreenHeight(170),
              width: getProportionateScreenWidth(330),
              child: const Column(
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
                              "1930331246040@dbatu.ac.in",
                              // style: TextStyle(fontSize: 18),
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
                            "Date of Birth:",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Text(
                            "24.03.2002",
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
                            "PRN:",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Text(
                            "1930331246040",
                            textAlign: TextAlign.end,
                          ))
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
                  border: Border.all(width: 15, color: Colors.transparent),
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
                          Icon(Icons.wallet_membership, color: Colors.red),
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
                          // SizedBox(
                          //   width: 70,
                          // ),
                          // Icon(Icons.arrow_forward_ios)
                          Expanded(
                            child: IconButton(
                                alignment: Alignment.topRight,
                                onPressed: () => Navigator.pushNamed(
                                    context, UpdateUserPage.routeName),
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
                  border: Border.all(width: 15, color: Colors.transparent),
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
                          // SizedBox(
                          //   width: 70,
                          // ),
                          // Icon(Icons.arrow_forward_ios)
                          Expanded(
                            child: IconButton(
                                alignment: Alignment.topRight,
                                onPressed: () => Navigator.pushNamed(
                                    context, ChangePassword.routeName),
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
                            alignment: Alignment.centerRight,
                            onPressed: () {},
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
                            "About App",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       const SizedBox(
    //         width: double.infinity,
    //         height: 50,
    //       ),
    //       CircleAvatar(
    //         backgroundColor: Colors.transparent,
    //         radius: 120,
    //         // maxRadius: 120,
    //         child: Image.asset('assets/logout-bg.png'),
    //       ),
    //       const SizedBox(height: 50),
    //       SizedBox(
    //         width: double.maxFinite,
    //         height: 45,
    //         child: TextButton(
    //           onPressed: () {
    // auth.signOut();
    // Navigator.pushNamedAndRemoveUntil(
    //     context, SignForm.routeName, (route) => false);
    //           },
    //           style: TextButton.styleFrom(
    // elevation: 5,
    // backgroundColor: Colors.blue,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(18.0),
    //                 side: const BorderSide(color: Colors.blueAccent))),
    //         child: const Text(
    //           'Sign Out',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
