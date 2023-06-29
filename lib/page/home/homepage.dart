import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/auth.dart';
import '../../widget/update_profile_button.dart';

final List<String> imgList = [
  'assets/poster_1.png',
  'assets/poster_2.png',
  'assets/poster_3.png',
  'assets/poster_4.png',
  'assets/poster_5.jpg',
];
int currentIndexPage = 0;
CarouselController carControll = CarouselController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String imgLink =
        'https://firebasestorage.googleapis.com/v0/b/fraternity-of-information-tech.appspot.com/o/user_profile%2Ftushar.jpg?alt=media&token=908b55e8-d0f1-42f3-ab8f-0daaf5e1748b';
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFFF4F0F5),
              Color(0xFFF4F0F5),
              // Color(0xFFF8E5E7),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 25,
          // ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<String>(
                  stream: getuser().asStream(),
                  // stream: getUserStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RichText(
                        text: TextSpan(
                          text: 'Hi',
                          style: GoogleFonts.karla(
                            fontSize: 20,
                            color: const Color(0xff463B57),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  snapshot.hasData ? ' ${snapshot.data} ✌' : '',
                              style: GoogleFonts.sacramento(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nWelcome to Fraternity of Information Technology!',
                              style: GoogleFonts.karla(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text(
                          'Loading...'); // Placeholder text while retrieving user data
                    }
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.0), //or 15.0
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: const Color(0xffFF0E58),
                    child: Image.network(
                      imgLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 0),
            child: Text(
              'Upcoming Event\'s',
              textAlign: TextAlign.start,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 275,
              aspectRatio: 16 / 9,
              viewportFraction: 0.5,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                currentIndexPage = index;
                setState(() {});
                // carControll.jumpToPage(index);
              },
            ),
            items: imgList
                .map(
                  (item) => InkWell(
                    onTap: () => openDialog(context, item),
                    child: Card(
                      // color: Colors.white.withOpacity(0.2),
                      surfaceTintColor: const Color(0xff9DB6EB),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: DotsIndicator(
              decorator: const DotsDecorator(activeColor: kPrimaryColor),
              dotsCount: imgList.length,
              position: currentIndexPage.toDouble(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/banner1.jpg')),
          ),
          // Container(
          //   decoration: BoxDecoration(color: Colors.amberAccent),
          //   height: 500,
          // ),
        ],
      ),
    );
  }
}

final currentuser = FirebaseAuth.instance.currentUser;
Future<String> getuser() async {
  var currentuser = FirebaseAuth.instance.currentUser;
  var querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: currentuser?.email)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    // Accessing the first document in the query snapshot
    var userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
    return userData['name'];
    // print("name");
  }
  // Handle the case when no documents match the query
  return '';
  // return querySnapshot.docs[0].data()['name'];
}

void openDialog(BuildContext context, String img) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return SomeDialog(img: img);
      },
      fullscreenDialog: true));
}

class SomeDialog extends StatelessWidget {
  const SomeDialog({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Deatils of  Programe',
          style: GoogleFonts.karla(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Image(
              image: AssetImage(img),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            // padding: EdgeInsets.all(8),
            width: double.maxFinite,
            height: 55,
            child: FitPulseButton(
              fontSize: 16,
              height: 55,
              hMargin: 0,
              onTap: () => _launchUrl(),
              text: 'Register',
            ),
            // child: TextButton(
            //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
            //   onPressed: () => _launchUrl(),
            //   child: Text(
            //     'Register',
            //     style: GoogleFonts.karla(color: Colors.white, fontSize: 20),
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}

final Uri _url = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSfE8l7wFN0elNU_0EDObDxaQ5vyzK1bnH6AdgJo9zD9buRkzw/viewform?usp=sf_link');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}
