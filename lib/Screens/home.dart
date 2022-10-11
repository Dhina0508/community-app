import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/clothes/clothesprof.dart';
import 'package:ecyc/Screens/missing_person/missing.dart';
import 'package:ecyc/Screens/education/educationprof.dart';
import 'package:ecyc/Screens/food/foodprof.dart';
import 'package:ecyc/Screens/medical/medicalprof.dart';
import 'package:ecyc/Screens/missing_person/missingprof.dart';
import 'package:ecyc/Screens/scribers/scriberprofile.dart';
import 'package:ecyc/firebase_helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blood/bloodprofile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference users =
      FirebaseFirestore.instance.collection("User_Bio_Data");

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 122, 201),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                service.signOut(context);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromARGB(221, 241, 32, 32),
              Color.fromARGB(234, 219, 33, 219),
              Color.fromARGB(210, 52, 18, 175),
              Color.fromARGB(210, 52, 18, 175),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Text(
            'ECYC',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/hand1.png',
            color: Colors.white.withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Common_Db")
                  .orderBy('Time')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      if (x['about'] == "Medical") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.local_hospital_rounded,
                              size: 40,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Patient Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => medicalprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "blood") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bloodtype_rounded,
                                  size: 45,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            title: Text(
                              "Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => bloodprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "food") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.food_bank_rounded,
                              size: 45,
                              color: Colors.amber,
                            ),
                            title: Text(
                              "Trust Name: " + x['Trust Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => foodprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "scribers") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.drive_file_rename_outline_rounded,
                              size: 45,
                              color: Colors.green,
                            ),
                            title: Text(
                              "Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => scribersprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "education") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.school_rounded,
                              size: 35,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Name : " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => educationalprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "cloth") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  x['img'],
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            title: Text(
                              "Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => clothesprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "missing") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  x['img'],
                                  fit: BoxFit.fill,
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            title: Text(
                              "Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Missingprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      }
                      return Container();
                    });
              }),
        ],
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
                        backgroundImage: NetworkImage(
                          "${data['img']}",
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 189, 122, 201)),
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
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text('Free Tution'),
                      leading: Icon(
                        Icons.spatial_audio_off_rounded,
                        color: Colors.black,
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
                      title: Text('Voluntering'),
                      leading: Icon(
                        Icons.person_add,
                        color: Colors.brown,
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
                      title: Text('Ambulance Service'),
                      leading: Icon(
                        Icons.emergency_share,
                        color: Colors.red,
                      ),
                      onTap: () => [
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Missing()))
                      ],
                    ),
                  ),
                  Divider(
                    height: 18,
                    color: Colors.black45,
                  ),
                  ListTile(
                    title: Text('Mapping With Foot Prints'),
                    leading: Icon(
                      Icons.person_pin_circle,
                      color: Colors.brown,
                    ),
                    onTap: () => [Navigator.of(context).pop()],
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    onTap: () => [Navigator.of(context).pop()],
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
                ],
              ));
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
