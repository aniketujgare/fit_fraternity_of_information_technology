import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        'https://lh3.googleusercontent.com/pw/AL9nZEWs3cKY40KLjCEaF4GWEC5u8yuN3KcJnORkk8kG418cobRHY_u1j5cqs02BCMj4iVq8Y2PR48gTeY05X39PBFktDIji0Ca8mhyrWO0GMclXYMUda2Xm-ygTopXCvzlE3HhJ0B_oEKvvAfK0JJNYhNSQhg=w665-h830-no?authuser=0';
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
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hi',
                    style: GoogleFonts.karla(
                      fontSize: 20,
                      color: const Color(0xff463B57),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\ Aniket ✌',
                        style: GoogleFonts.sacramento(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nWelcome to Fraternity of Information Technology!',
                        style: GoogleFonts.karla(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Upcoming Event\'s',
            ),
          ),
          // Image.network(imgLink),
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
          // Card(
          //   elevation: 10,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Image.asset('assets/banner1.jpg')),
          // ),
          // const SizedBox(height: 72),
        ],
      ),
    );
  }
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
          'Student Inaguration Programe',
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
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => _launchUrl(),
              child: Text(
                'Register',
                style: GoogleFonts.karla(color: Colors.white, fontSize: 20),
              ),
            ),
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
