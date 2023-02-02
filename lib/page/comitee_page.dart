import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../components/member_card.dart';

final List<String> imgList = [
  'assets/poster_1.png',
  'assets/poster_2.png',
  'assets/poster_3.png',
  'assets/poster_4.png',
  'assets/poster_5.jpg',
];
int currentIndexPage = 0;
CarouselController carControll = CarouselController();

class ComiteePage extends StatefulWidget {
  const ComiteePage({super.key});

  @override
  State<ComiteePage> createState() => _ComiteePageState();
}

class _ComiteePageState extends State<ComiteePage> {
  String firstName = 'ANIKET', lastName = 'UJGARE';
  String designation = 'PRESIDENT';
  String phoneNumber1 = '9175197037', phoneNumber2 = '7020155284';
  String email = 'aniketujgare@gmail.com';
  String website = 'aniketcodes.pythonanywhere.com';
  String address1 = 'Opposite S.R.P.F. Camp', address2 = 'Hingoli-431513';

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
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/banner1.jpg')),
          ),
          const SizedBox(
            height: 10,
          ),
          const MemberCard(
            imgLink: 'assets/aniket.png',
            firstName: 'ANIKET',
            lastName: 'UJGARE',
            designation: 'PRESIDENT',
            phoneNumber1: '9175197037',
            phoneNumber2: '7020155284',
            email: 'aniketujgare@gmail.com',
            website: 'aniketcodes.pythonanywhere.com/',
            latitude: '19.714120',
            longitude: '77.169607',
            placeLabel: 'Hingoli',
            address1: 'SRPF Camp Gr. 12',
            address2: 'Hingoli - 431513',
          ),
          const MemberCard(
            imgLink: 'assets/sadaf.jpg',
            firstName: 'SADAF',
            lastName: 'MAPKAR',
            designation: 'member',
            phoneNumber1: '9175197037',
            phoneNumber2: '7020155284',
            email: 'sdzmf@gmail.com',
            website: 'Sadaf.com',
            latitude: '18.196678',
            longitude: '73.262715',
            placeLabel: 'Dahiwali',
            address1: 'Dahiwali',
            address2: 'Mangaon - 402103',
          ),
          const MemberCard(
            imgLink: 'assets/vaibhav.jpg',
            firstName: 'VAIBHAV',
            lastName: 'GHADGE',
            designation: 'BOUNCER',
            phoneNumber1: '9307210205',
            phoneNumber2: '7020155284',
            email: 'vaibha2@gmail.com',
            website: 'www.Ubouncer.com',
            latitude: '19.30602947180262',
            longitude: '73.06005991237481',
            placeLabel: 'Bhiwandi',
            address1: 'Shivaji Chowk',
            address2: 'Bhiwandi - 421302',
          ),
          const MemberCard(
            imgLink: 'assets/tushar.jpg',
            firstName: 'TUSHAR',
            lastName: 'SHINDE',
            designation: 'TREASURER',
            phoneNumber1: '7875738666',
            phoneNumber2: '7020155284',
            email: 'tugshinde@gmail.com',
            website: 'tusharvlogs.com',
            latitude: '19.30602947180262',
            longitude: '73.06005991237481',
            placeLabel: 'Latur',
            address1: 'PVR Cinemas',
            address2: 'Latur - 431405',
          ),
          const MemberCard(
            imgLink: 'assets/pravin.jpg',
            firstName: 'PRAVIN',
            lastName: ' ',
            designation: 'LEGEND',
            phoneNumber1: '9307210205',
            phoneNumber2: '7020155284',
            email: 'pravins@gmail.com',
            website: 'codingpravin.com',
            latitude: '19.30602947180262',
            longitude: '73.06005991237481',
            placeLabel: 'Latur',
            address1: 'Ganjgol',
            address2: 'Latur - 431405',
          ),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}

String imgLink =
    'https://lh3.googleusercontent.com/pw/AL9nZEWs3cKY40KLjCEaF4GWEC5u8yuN3KcJnORkk8kG418cobRHY_u1j5cqs02BCMj4iVq8Y2PR48gTeY05X39PBFktDIji0Ca8mhyrWO0GMclXYMUda2Xm-ygTopXCvzlE3HhJ0B_oEKvvAfK0JJNYhNSQhg=w665-h830-no?authuser=0';
