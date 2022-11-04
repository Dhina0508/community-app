import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:ecyc/Screens/missing_person/missing.dart';

import 'package:ecyc/firebase_helper/firebase_helper.dart';
import 'package:ecyc/helper/dimensions.dart';
import 'package:ecyc/mapping_with_foot_prints/gmap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _DotPosition = 0;
  var _FireStoreInstance = FirebaseFirestore.instance;
  List _SlidingImages = [];
  CollectionReference users =
      FirebaseFirestore.instance.collection("User_Bio_Data");

  Service service = Service();
  FetchSlidingImages() async {
    QuerySnapshot qn = await _FireStoreInstance.collection("Posters").get();
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
    return Scaffold(
      // backgroundColor: Color.fromRGBO(248, 68, 100, 300),
      backgroundColor: Color.fromARGB(255, 202, 191, 191),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('chatlobby')],
              icon: Icon(
                Icons.mail,
                color: Colors.white,
                size: 35,
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => gmap()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/globe1.png',
                  height: Dimension.height30, width: Dimension.width30),
            ),
          ),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // gradient: LinearGradient(colors: [
            //   Color.fromARGB(221, 241, 32, 32),
            //   Color.fromARGB(234, 219, 33, 219),
            //   Color.fromARGB(210, 52, 18, 175),
            //   Color.fromARGB(210, 52, 18, 175),
            // ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Text(
            'ECYC',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                      autoPlayAnimationDuration: Duration(milliseconds: 700),
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (val, carouselPageChangedReason) {
                        _DotPosition = val;
                      }),
                ),
                DotsIndicator(
                    dotsCount:
                        _SlidingImages.length == 0 ? 1 : _SlidingImages.length,
                    position: _DotPosition.toDouble(),
                    decorator: DotsDecorator(
                        activeColor: Colors.red,
                        spacing: EdgeInsets.all(2),
                        activeSize: Size(8, 8),
                        size: Size(6, 6))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Blood Donation',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                child: Image.asset(
                                  'images/blood_img.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Health/Oragans',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                child: Image.asset(
                                  'images/plus.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Food Donation',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                child: Image.asset(
                                  'images/food_donation.jpg',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Clothes',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                child: Image.asset(
                                  'images/cloth_img.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Education Today',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'images/book.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Missing Person',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                child: Image.asset(
                                  'images/missing_person.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: Dimension.height200,
                        width: Dimension.width170,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                'Voluntering',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: Dimension.height10,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'images/volunteer-icon-10.png',
                                ),
                              ),
                              Text(
                                'Approved : Nil',
                                style: TextStyle(
                                  fontSize: Dimension.font20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      drawer: FutureBuilder<DocumentSnapshot>(
          future: users.doc(FirebaseAuth.instance.currentUser!.email).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Center(child: Text("Document does not exist"));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Drawer(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    otherAccountsPictures: <Widget>[
                      Icon(
                        Icons.brightness_2_rounded,
                        color: Colors.white,
                      ),
                    ],
                    accountName: GestureDetector(
                      child: Text(
                        "${data['Name']}",
                        style: TextStyle(fontSize: 18, fontFamily: 'Cinzel'),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('profile');
                      },
                    ),
                    accountEmail: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('profile');
                        },
                        child: Text("${data['Email']}")),
                    currentAccountPicture: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('profile');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "${data['img']}",
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 68, 100, 300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, top: 10),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Health Care :",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Blood Donation'),
                      leading: Icon(
                        Icons.bloodtype,
                        color: Colors.red,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('blood')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text("Health / Organs"),
                      leading: Icon(
                        Icons.local_hospital,
                        color: Colors.red,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('medical')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, top: 10),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Basics :",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Food'),
                      leading: Icon(
                        Icons.food_bank,
                        color: Colors.amber,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('food')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Clothes'),
                      leading: Image.asset(
                        'images/tshirt.png',
                        height: 25,
                        width: 25,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('clothes')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, top: 10),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Education :",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 25),
                  //   child: ListTile(
                  //       title: Text('Free Tution'),
                  //       leading: Icon(
                  //         Icons.spatial_audio_off_rounded,
                  //         color: Colors.black,
                  //       ),
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Free_tution()));
                  //       }),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Educate Today'),
                      leading: Icon(
                        Icons.cast_for_education,
                        color: Colors.red,
                      ),
                      onTap: () =>
                          [Navigator.of(context).pushNamed('education')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Book Donation'),
                      leading: Icon(
                        Icons.menu_book,
                        color: Colors.brown,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('books')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Scribers'),
                      leading: Icon(
                        Icons.drive_file_rename_outline_rounded,
                        color: Colors.purple,
                      ),
                      onTap: () =>
                          [Navigator.of(context).pushNamed('scribers')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, top: 10),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Emergencies :",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Missing Person'),
                      leading: Icon(
                        Icons.person_off,
                        color: Colors.red,
                      ),
                      onTap: () => [
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Missing()))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('SOS'),
                      leading: Icon(
                        Icons.girl,
                        color: Colors.black,
                      ),
                      onTap: () => [Navigator.of(context).pushNamed('sos')],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Ambulance Service'),
                      leading: Icon(
                        Icons.emergency_share,
                        color: Colors.red,
                      ),
                      onTap: () => [],
                    ),
                  ),
                  Divider(
                    height: 18,
                    color: Colors.black45,
                  ),

                  ListTile(
                    title: Text('Happenings'),
                    leading: Icon(
                      Icons.person_pin_circle,
                      color: Colors.red,
                    ),
                    onTap: () => [
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => gmap()))
                    ],
                  ),
                  ListTile(
                    title: Text('Voluntering'),
                    leading: Icon(
                      Icons.person_add,
                      color: Colors.brown,
                    ),
                    onTap: () => [],
                  ),
                  Divider(
                    height: 18,
                    color: Colors.black45,
                  ),
                  ListTile(
                    title: Text('Invite Friends'),
                    leading: Icon(Icons.person_add),
                    onTap: () => [],
                  ),
                  ListTile(
                    title: Text('ECYC Features'),
                    leading: Icon(Icons.help_outline_sharp),
                    onTap: () => [],
                  ),
                  ListTile(
                    title: Text('Log Out'),
                    leading: Icon(Icons.logout),
                    onTap: () async {
                      service.signOut(context);
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("email");
                    },
                  ),
                ],
              ));
            }
            return Drawer();
          }),
    );
  }
}
