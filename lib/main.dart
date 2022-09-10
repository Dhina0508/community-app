import 'package:ecyc/Screens/MyProfile.dart';
import 'package:ecyc/Screens/blood/blood.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/blood/bloodreg.dart';
import 'package:ecyc/Screens/clothes/clothes.dart';
import 'package:ecyc/Screens/clothes/clothesreg.dart';
import 'package:ecyc/Screens/education/education.dart';
import 'package:ecyc/Screens/education/educationreq.dart';
import 'package:ecyc/Screens/food/food.dart';
import 'package:ecyc/Screens/food/foodprof.dart';
import 'package:ecyc/Screens/food/foodreg.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/medical/medical.dart';
import 'package:ecyc/Screens/medical/medicalreg.dart';
import 'package:ecyc/Screens/upadateUser.dart';

import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:ecyc/login_and_register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: email == null ? MyHomePage() : Home(),
    routes: {
      'blood': (context) => blood(),
      'medical': (context) => medical(),
      'education': (context) => education(),
      'food': (context) => food(),
      'clothes': (context) => clothes(),
      'bloodreg': (context) => bloodreg(),
      'medicalreg': (context) => medicalreg(),
      'educationreg': (context) => educationreg(),
      'clothesreg': (context) => clothesreg(),
      'foodreg': (context) => foodreg(),
      'register': (context) => register(),
      'login': (context) => MyHomePage(),
      'profile': (context) => MyProfile(),
      'update': (context) => update(),
      'home': (context) => Home()
    },
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Ink(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 236, 5, 5),
          Color.fromARGB(234, 216, 114, 216),
          Color.fromARGB(236, 91, 19, 159),
          Color.fromARGB(235, 51, 11, 120),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'ECYC',
              style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "First People Community App",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 199, 191, 191),
                fontFamily: 'JosefinSans'),
          ),
          SizedBox(
            height: 60,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    ));
  }
}
