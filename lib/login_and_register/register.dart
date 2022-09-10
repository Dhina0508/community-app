import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController _NameController = TextEditingController();

  TextEditingController _EmailController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _AddressController = TextEditingController();

  SendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).set({
      "Name": _NameController.text,
      "Email": _EmailController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Address": _AddressController.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details Of The User Has Been Added"),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.of(context).popAndPushNamed('login');
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("ERROR ${onError.toString()}"),
        behavior: SnackBarBehavior.floating,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.redAccent[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bio of the User',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Submit to continue',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.redAccent[200],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'We will not share this with anyone',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, top: 30, left: 8),
                      child: TextFormField(
                        controller: _NameController,
                        decoration: InputDecoration(
                            labelText: 'Full name',
                            prefixIcon: Icon(
                              Icons.account_box_rounded,
                              color: Colors.redAccent[200],
                              size: 40,
                            ),
                            hintText: 'Enter your Name'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, top: 30, left: 8),
                      child: TextFormField(
                        controller: _EmailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.redAccent[200],
                              size: 40,
                            ),
                            hintText: 'user@email.com'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, right: 8, left: 8),
                      child: TextFormField(
                        controller: _PhoneNoController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(
                            Icons.phone_android_rounded,
                            color: Colors.redAccent[200],
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, top: 30, left: 8),
                      child: TextFormField(
                        controller: _AddressController,
                        decoration: InputDecoration(
                            labelText: 'Address',
                            prefixIcon: Icon(
                              Icons.house_rounded,
                              color: Colors.redAccent[200],
                              size: 40,
                            ),
                            hintText: 'Your address'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, top: 30.0, left: 8),
                      child: ElevatedButton(
                          onPressed: () {
                            SendUserDataToDB();
                          },
                          child: Text('   Submit   ')),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
