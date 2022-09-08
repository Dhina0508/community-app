import 'package:ecyc/Screens/blood/blood.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/blood/bloodreg.dart';
import 'package:ecyc/Screens/education/education.dart';
import 'package:ecyc/Screens/education/educationreq.dart';
import 'package:ecyc/Screens/food/food.dart';
import 'package:ecyc/Screens/food/foodprof.dart';
import 'package:ecyc/Screens/food/foodreg.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/medical/medical.dart';
import 'package:ecyc/Screens/medical/medicalreg.dart';
import 'package:ecyc/dimensions/dimensions.dart';
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
      'medicalreg': (context) => medicalreg(),
      'educationreg': (context) => educationreg(),
      'foodreg': (context) => foodreg(),
      'foodprof': (context) => foodprof()
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
        backgroundColor: Color.fromRGBO(28, 11, 67, 0.9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(left: Dimension.width20),
            //   child: Image.asset(
            //     'images/frontpage.jpg',
            //   ),
            // ),
            SizedBox(
              height: 45,
            ),
            CircularProgressIndicator()
          ],
        ));
  }
}
