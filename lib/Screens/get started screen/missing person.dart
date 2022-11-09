import 'package:ecyc/Screens/get%20started%20screen/all.dart';
import 'package:ecyc/Screens/get%20started%20screen/food%20start%20screen.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:ecyc/login_and_register/phone_no_verification.dart';
import 'package:flutter/material.dart';

class MissingPerssonStartScreen extends StatefulWidget {
  MissingPerssonStartScreen({Key? key}) : super(key: key);

  @override
  State<MissingPerssonStartScreen> createState() =>
      _MissingPerssonStartScreenState();
}

class _MissingPerssonStartScreenState extends State<MissingPerssonStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Spacer(),
          Image.asset(
            'images/missing_person.png',
            width: 400,
            height: 400,
          ),
          Text(
            'Missing Person',
            style: TextStyle(fontFamily: 'Cinzel', fontSize: 27),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Missed some one in Chennai??",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontFamily: 'JosefinSans'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Find them with the app!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontFamily: 'JosefinSans'),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => All()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(236, 13, 53, 1),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => All()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(236, 13, 53, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(90, 40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
