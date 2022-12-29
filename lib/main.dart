import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fit_fraternity_of_information_technology/page/homepage.dart';
import 'package:fit_fraternity_of_information_technology/page/searchPage.dart';
import 'package:fit_fraternity_of_information_technology/routs.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/sign_in_screen.dart';
import 'package:fit_fraternity_of_information_technology/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'GNav',
      theme: ThemeData(primaryColor: Colors.blue),
      // home: const MyHomePage(),
      initialRoute: SignInScreen.routeName,
      routes: routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/my_home';
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int index = 2;

class _MyHomePageState extends State<MyHomePage> {
  final screens = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    // const SignOutScreen(),
  ];
  final items = const [
    Icon(Icons.search, size: 30),
    Icon(Icons.settings, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.person, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ClipRRect(
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: GradientColors.lightBlue,
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            title: Text(
              'Fraternity of Information Technology',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
            actions: [
              Image.asset(
                'assets/fit_logo.png',
              ),
            ],
            elevation: 3,
            // centerTitle: true,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
            child: CurvedNavigationBar(
              items: items,
              index: index,
              animationCurve: Curves.easeOut,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.blue,
              onTap: (idx) => setState(() => index = idx),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: GradientColors.snowAgain,
            )),
            child: screens[index],
          ),
        ),
      ),
    );
  }
}
