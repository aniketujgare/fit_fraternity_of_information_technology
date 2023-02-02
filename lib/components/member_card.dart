import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.imgLink,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.email,
    required this.website,
    required this.address1,
    required this.address2,
    required this.latitude,
    required this.longitude,
    required this.placeLabel,
  }) : super(key: key);

  final String imgLink;
  final String firstName;
  final String lastName;
  final String designation;
  final String phoneNumber1;
  final String phoneNumber2;
  final String email;
  final String website;
  final String latitude;
  final String longitude;
  final String placeLabel;
  final String address1;
  final String address2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(0xFF0F343C),
          border: Border.all(
            width: 15,
            color: const Color(0XFF77D0E0),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: 275,
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 250,
              child: Image(
                image: AssetImage(
                  imgLink,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 15),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: '',
                      style: GoogleFonts.karla(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: firstName,
                          style: const TextStyle(
                            color: Color(0XFF77D0E0),
                          ),
                        ),
                        TextSpan(
                          text: ' $lastName',
                        ),
                        TextSpan(
                          text: '\n$designation',
                          style: const TextStyle(
                            // height: 2,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 101,
                    thickness: 3,
                    color: Color(0XFF77D0E0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: 135,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '+91 $phoneNumber1',
                                style: const TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '+91 $phoneNumber2',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: const Color(0XFF77D0E0),
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => _makePhoneCall(phoneNumber1),
                            child: const Image(
                              image: AssetImage(
                                'assets/telephone.png',
                              ),
                              height: 23,
                              color: Color(0XFF0F313A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: 135,
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                email,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                website,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: const Color(0XFF77D0E0),
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => _sendEmail(email),
                            child: const Image(
                              image: AssetImage(
                                'assets/email.png',
                              ),
                              height: 23,
                              color: Color(0XFF0F313A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: 135,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                address1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                address2,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: const Color(0XFF77D0E0),
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => openMap(
                                latitude: latitude,
                                longitude: longitude,
                                label: placeLabel),
                            child: const Image(
                              image: AssetImage(
                                'assets/home.png',
                              ),
                              height: 23,
                              color: Color(0XFF0F313A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Future<void> _sendEmail(String email) async {
  await launchUrl(
    Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'A query to President',
      }),
    ),
  );
}

Future<void> openMap({
  required String latitude,
  required String longitude,
  required String label,
}) async {
  final query = '$latitude,$longitude($label)';
  final uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});

  await launchUrl(uri);
}
