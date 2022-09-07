import 'package:ecyc/Screens/blood.dart';
import 'package:ecyc/Screens/bloodprofile.dart';
import 'package:ecyc/Screens/bloodreg.dart';
import 'package:ecyc/Screens/education.dart';
import 'package:ecyc/Screens/food.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/medical.dart';
import 'package:ecyc/Screens/medicalreg.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
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
      'bloodreg': (context) => bloodreg(),
      'bloodprof': (context) => bloodprof(),
      'medicalreg': (context) => medicalreg()
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
