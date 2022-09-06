import 'package:ecyc/Screens/blood.dart';
import 'package:ecyc/Screens/bloodprofile.dart';
import 'package:ecyc/Screens/bloodreg.dart';
import 'package:ecyc/Screens/education.dart';
import 'package:ecyc/Screens/food.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/medical.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        'blood': (context) => blood(),
        'medical': (context) => medical(),
        'education': (context) => education(),
        'food': (context) => food(),
        'bloodreg': (context) => bloodreg(),
        'bloodprof': (context) => bloodprof()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
