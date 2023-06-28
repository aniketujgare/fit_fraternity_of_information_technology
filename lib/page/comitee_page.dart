import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../components/member_card.dart';

// int currentIndexPage = 0;
// CarouselController carControll = CarouselController();

class ComiteePage extends StatefulWidget {
  const ComiteePage({super.key});

  @override
  State<ComiteePage> createState() => _ComiteePageState();
}

class _ComiteePageState extends State<ComiteePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
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
              imgLink: 'assets/yash.HEIC',
              firstName: 'Yash',
              lastName: 'Bansod',
              designation: 'President',
              phoneNumber1: '7038588451',
              phoneNumber2: '8600811489',
              email: 'bansod.yash24@gmail.com',
              website: 'coretechtive.com',
              latitude: '18.196678',
              longitude: '73.262715',
              placeLabel: 'Anjangaon',
              address1: 'Amravati',
              address2: 'MH - 444705',
            ),
            const MemberCard(
              imgLink: 'assets/siddi.jpg',
              firstName: 'Siddhi',
              lastName: 'Saptpute',
              designation: 'Vice-president',
              phoneNumber1: '9405788123',
              phoneNumber2: '9405788123',
              email: 'sssatpute@gmail.com',
              website: 'coretechtiv.com',
              latitude: '19.30602947180262',
              longitude: '73.06005991237481',
              placeLabel: 'Parbhani',
              address1: 'Parbhani',
              address2: 'Parbhani - 431401',
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
            // const MemberCard(
            //   imgLink: 'assets/pravin.jpg',
            //   firstName: 'PRAVIN',
            //   lastName: ' ',
            //   designation: 'LEGEND',
            //   phoneNumber1: '9307210205',
            //   phoneNumber2: '7020155284',
            //   email: 'pravins@gmail.com',
            //   website: 'codingpravin.com',
            //   latitude: '19.30602947180262',
            //   longitude: '73.06005991237481',
            //   placeLabel: 'Latur',
            //   address1: 'Ganjgol',
            //   address2: 'Latur - 431405',
            // ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}
