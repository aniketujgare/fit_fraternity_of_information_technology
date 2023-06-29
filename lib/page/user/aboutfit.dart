import 'package:flutter/material.dart';

import '../../constants.dart';

class Aboutfit extends StatelessWidget {
  static String routeName = '/about_fit';
  const Aboutfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // GestureDetector(f(context).pop(),
        //     child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        backgroundColor: Colors.white,
        title: Text(
          textAlign: TextAlign.left,
          'FIT',
          style: textStyle.copyWith(fontSize: 20),
        ),
      ),
      // AppBar(
      //   title: Text("FIT"),
      // ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0,
                ),
                Text(
                  "Fraternity of Information Technology (FIT):",
                  style: textStyle.copyWith(fontSize: 20),
                ),
                Text(
                    "The Fraternity of Information Technology (FIT) is a student organization established within the Information Technology department of Dr. Babasaheb Ambedkar Technological University. FIT aims to foster academic and cultural growth among its members and is composed of enthusiastic students passionate about information technology."),
                Text(
                  "Leadership Positions:",
                  style: textStyle.copyWith(fontSize: 18),
                ),
                Text(
                    "FIT is led by a dedicated team holding key positions to ensure the smooth functioning and success of the fraternity. These positions include:"),
                Text(
                  "a. President:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "The President of FIT serves as the overall leader, responsible for providing direction, overseeing event planning and execution, and representing FIT in various forums. They provide guidance and support to the team members and ensure the fraternity's goals are met."),
                Text(
                  "b. Treasurer:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "The Treasurer handles the financial aspects of FIT, managing budgets, fundraising efforts, and maintaining financial records. They play a crucial role in ensuring the financial stability and sustainability of FIT's activities."),
                Text(
                  "c. Cultural Secretaries:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "The Cultural Secretaries are responsible for organizing cultural events and activities within FIT. They collaborate with members to plan festivals, cultural celebrations, and performances such as dance, music, and drama. These events promote cultural diversity and provide platforms for students to showcase their talents."),
                Text(
                  "d. Technical Secretaries:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "The Technical Secretaries are in charge of arranging technical workshops, seminars, and competitions. These events aim to enhance technical knowledge, encourage innovation, and provide opportunities for students to apply their skills in real-world scenarios. Topics covered may include coding, web development, data science, and emerging technologies. give some detail informatin of orgainizing members of fit"),
                Text(
                  "e. Committee Members:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "FIT consists of dedicated committee members who actively contribute to the fraternity's activities. These members assist in event planning, execution, and promotion. They may take on specific roles within subcommittees, such as marketing, logistics, hospitality, or media, depending on their skills and interests. Committee members actively participate in discussions, provide creative inputs, and contribute to the overall success of FIT's initiatives."),
                Text(
                    "The organizing members of FIT work collaboratively, sharing responsibilities and leveraging their skills to create a vibrant and engaging environment for students. Together, they ensure the smooth functioning of the fraternity, promote personal and professional development, and create memorable experiences for all FIT members."),
                Divider(color: Colors.black, thickness: 0.5),
                Text(
                  "FIT Organized Events:",
                  style: textStyle.copyWith(fontSize: 18),
                ),
                Text(
                    "FIT organizes a wide range of events to enrich the academic and cultural experiences of its members. These events include:"),
                Text(
                  "FIT Week:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "FIT Week is a multi-day event that serves as a platform for students to exhibit their talents, exchange ideas, and network with industry professionals. It showcases a diverse range of activities, combining technical and cultural events. FIT Week typically includes the following:"),
                Text(
                  "Workshops and Guest Lectures:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "FIT Week features workshops and guest lectures conducted by industry experts, professors, and professionals. These sessions provide insights into the latest trends and developments in the field of information technology."),
                Text(
                  "Project Exhibitions:",
                  style: textStyle.copyWith(fontSize: 16),
                ),
                Text(
                    "Students get the opportunity to showcase their innovative projects and research work during FIT Week. Project exhibitions allow participants to demonstrate their technical skills, problem-solving abilities, and creativity.")
              ],
            ),
          )),
    );
  }
}
