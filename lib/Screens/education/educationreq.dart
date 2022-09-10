import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class educationreg extends StatefulWidget {
  educationreg({Key? key}) : super(key: key);

  @override
  State<educationreg> createState() => _registerState();
}

class _registerState extends State<educationreg> {
  TextEditingController _NameController = TextEditingController();

  TextEditingController _EducationController = TextEditingController();

  TextEditingController _InstitutionController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _AddressController = TextEditingController();

  TextEditingController _DiscriptionController = TextEditingController();

  SendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("Education_Req_List");
    return _CollectionReference.doc().set({
      "Name": _NameController.text,
      "Education_List": _EducationController.text,
      "Institution_name": _InstitutionController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Address": _AddressController.text,
      "description": _DiscriptionController.text
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details Of The User Has Been Added"),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.of(context).pop();
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Fill up the Details',
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
              Color.fromARGB(234, 131, 56, 188),
              Color.fromARGB(235, 90, 31, 146),
              Color.fromARGB(235, 51, 11, 120),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Submit to Post Request',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.redAccent[200],
                            fontWeight: FontWeight.bold),
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
                              hintText: 'someone'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _InstitutionController,
                          decoration: InputDecoration(
                              labelText: 'Institution Name',
                              prefixIcon: Icon(
                                Icons.school_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Collage Or School Name'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _EducationController,
                          decoration: InputDecoration(
                              labelText: 'Education type',
                              prefixIcon: Icon(
                                Icons.menu_book_rounded,
                                color: Colors.redAccent,
                                size: 40,
                              ),
                              hintText: 'Eg.UG,PG,..'),
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
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _DiscriptionController,
                          decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.redAccent[200],
                                size: 40,
                              ),
                              hintText: 'Student Description'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30.0, left: 8),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_NameController.text != '' &&
                                  _PhoneNoController.text != '' &&
                                  _AddressController.text != '' &&
                                  _DiscriptionController.text != '' &&
                                  _InstitutionController.text != '') {
                                SendUserDataToDB();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Error : Details cannot be empty"),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                ));
                              }
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
          ),
        ));
  }
}
