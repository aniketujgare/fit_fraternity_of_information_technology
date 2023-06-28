import 'package:flutter/material.dart';

class PaymentMembership extends StatelessWidget {
  static String routeName = '/payment_membership';
  const PaymentMembership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<String>(
                  // stream: getUserStream(),
                  builder: (context, snapshot) {
                    return RichText(
                      text: TextSpan(
                        text: 'Hi',
                        // style: GoogleFonts.karla(
                        //   fontSize: 20,
                        //   color: const Color(0xff463B57),
                        // ),
                        children: [
                          TextSpan(
                            text: snapshot.hasData ? ' ${snapshot.data} ✌' : '',
                            // style: GoogleFonts.sacramento(
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                          TextSpan(
                            text:
                                '\nWelcome to Fraternity of Information Technology!',
                            // style: GoogleFonts.karla(
                            //   fontSize: 13,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.0), //or 15.0
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: const Color(0xffFF0E58),
                    // child: Image.network(
                    //   imgLink,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ],)]),
    );
  }
}
