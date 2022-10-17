import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/map/mymap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  CommonDb() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    final _CollectionReference =
        FirebaseFirestore.instance.collection("Common_Db").doc();
    final loc.LocationData _locationResult = await location.getLocation();

    return _CollectionReference.set({
      "about": "Emergency",
      'latitude': _locationResult.latitude,
      'longitude': _locationResult.longitude,
    });
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location'),
      ),
      body: Column(children: [
        Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('location')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Your Latitude and Longitude',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['latitude']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'and',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['longitude']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  _getLocation();
                                },
                                child: Text('Refresh')),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 70,
                              width: 100,
                              color: Color.fromARGB(255, 233, 130, 122),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Show on Map'),
                                  IconButton(
                                    icon: Icon(Icons.directions),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => MyMap(
                                                  snapshot
                                                      .data!.docs[index].id)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              color: Colors.blue,
                              child: TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Your Request has been Posted! , Be Safe"),
                                      behavior: SnackBarBehavior.fixed,
                                      duration: Duration(seconds: 2),
                                    ));
                                    CommonDb();

                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Post My Request",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        );
                      });
                }))
      ]),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'Dhina'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
