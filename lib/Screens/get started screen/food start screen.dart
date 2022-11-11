import 'package:ecyc/Screens/get%20started%20screen/all.dart';
import 'package:ecyc/Screens/get%20started%20screen/missing%20person.dart';
import 'package:flutter/material.dart';

class FoodStartScreen extends StatefulWidget {
  FoodStartScreen({Key? key}) : super(key: key);

  @override
  State<FoodStartScreen> createState() => _FoodStartScreenState();
}

class _FoodStartScreenState extends State<FoodStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Image.asset(
            'images/food.jpeg',
            width: 400,
            height: 400,
          ),
          Text(
            'Food Donation',
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
                  "Donate food and make needy happy.",
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
                  "Share What You Can",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MissingPerssonStartScreen()));
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
