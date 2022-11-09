import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:ecyc/login_and_register/phone_no_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  var _DotPosition = 0;
  var _FireStoreInstance = FirebaseFirestore.instance;
  List<String> _SlidingImages = [];

  FetchSlidingImages() async {
    QuerySnapshot qn =
        await _FireStoreInstance.collection("loginpage_photos").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _SlidingImages.add(qn.docs[i]["img"]);
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    // TODO: implement initState
    FetchSlidingImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String done = "done";
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'Welcome',
            style: TextStyle(fontFamily: 'Cinzel', fontSize: 25),
          ),
          SizedBox(
            height: 50,
          ),
          CarouselSlider(
            items: _SlidingImages.map((item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                )).toList(),
            options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 900),
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (val, carouselPageChangedReason) {
                  _DotPosition = val;
                }),
          ),
          DotsIndicator(
              dotsCount: _SlidingImages.length == 0 ? 1 : _SlidingImages.length,
              position: _DotPosition.toDouble(),
              decorator: DotsDecorator(
                  activeColor: Colors.red,
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8, 8),
                  size: Size(6, 6))),
          SizedBox(
            height: 60,
          ),
          Text(
            'Wanna make a miracle?',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
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
                  "We are together",
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
                  "Make a difference to people's life with just one App",
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
          ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString("status", done);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneNoVerification()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(236, 13, 53, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: const Size(140, 40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an Account?',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  //decoration: TextDecoration.underline,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(236, 13, 53, 1),
                      //   decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      )),
    );
  }
}
