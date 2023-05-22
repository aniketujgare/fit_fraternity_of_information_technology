import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/comitee_page.dart';
import 'package:fit_fraternity_of_information_technology/page/homepage.dart';
import 'package:fit_fraternity_of_information_technology/page/image_gallery_page.dart';
import 'package:fit_fraternity_of_information_technology/page/news_page.dart';
import 'package:fit_fraternity_of_information_technology/page/user_page.dart';
import 'package:fit_fraternity_of_information_technology/routs.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/components/sign_form.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_in/sign_in_screen.dart';
import 'package:fit_fraternity_of_information_technology/screens/sign_up/sign_up_screen.dart';
import 'package:fit_fraternity_of_information_technology/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  runApp(
    MaterialApp(
      title: 'FIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // primary: Colors.grey[200],
          secondary: kPrimaryColor,
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.karla(
            color: const Color(0xff463B57),
          ),
        ),
      ),
      initialRoute: SignForm.routeName
      // SignForm.routeName
      //  auth.currentUser != null
      //     ? MyHomePage.routeName
      //     : SignInScreen.routeName,
      ,
      routes: routes,
      debugShowCheckedModeBanner: false,
    ),
  );

  FlutterNativeSplash.remove();
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/my_home';
  MyHomePage({super.key});
  final screens = [
    const ComiteePage(),
    const NewsPage(),
    const HomePage(),
    const ImageGalleryPage(),
    const UserPage(),
  ];
  final items = const [
    Icon(Icons.people, size: 30),
    Icon(Icons.newspaper, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.image, size: 30),
    Icon(Icons.person, size: 30),
  ];

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ClipRRect(
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey.shade200,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
            child: CurvedNavigationBar(
              height: 60,
              items: widget.items,
              index: index,
              animationCurve: Curves.easeOut,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.blue,
              onTap: (idx) => setState(() => index = idx),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.snowAgain,
                ),
              ),
              child: IndexedStack(
                index: index,
                children: widget.screens,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
