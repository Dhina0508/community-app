import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class foodreg extends StatefulWidget {
  foodreg({Key? key}) : super(key: key);

  @override
  State<foodreg> createState() => _registerState();
}

class _registerState extends State<foodreg> {
  TextEditingController _TrustController = TextEditingController();

  TextEditingController _PeopleController = TextEditingController();

  TextEditingController _CategoryController = TextEditingController();

  TextEditingController _MealController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _DiscriptionController = TextEditingController();

  TextEditingController _YourNameController = TextEditingController();

  TextEditingController _datecontroller = TextEditingController();

  var email = FirebaseAuth.instance.currentUser!.email;

  // SendUserDataToDB() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentuser = _auth.currentUser;

  //   final _CollectionReference =
  //       FirebaseFirestore.instance.collection("Food_Req_List").doc();
  //   return _CollectionReference.set({
  //     "id": _CollectionReference.id,
  //     "about": 'food',
  //     "Trust Name": _TrustController.text,
  //     "Meal": _MealController.text,
  //     "Pepole_List": _PeopleController.text,
  //     "Category_name": _CategoryController.text,
  //     "PhoneNumber": _PhoneNoController.text,
  //     "Discription": _DiscriptionController.text,
  //   }).then((value) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Details Of The User Has Been Added"),
  //       behavior: SnackBarBehavior.floating,
  //     ));
  //     Navigator.of(context).pop();
  //   }).catchError((onError) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("ERROR ${onError.toString()}"),
  //       behavior: SnackBarBehavior.floating,
  //     ));
  //   });
  // }

  CommonDb() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    final _CollectionReference =
        FirebaseFirestore.instance.collection("Common_Db").doc();
    return _CollectionReference.set({
      "id": _CollectionReference.id,
      "about": 'food',
      "Trust Name": _TrustController.text,
      "Your_name": FirebaseAuth.instance.currentUser?.displayName,
      "email": email,
      "Meal": _MealController.text,
      "Pepole_List": _PeopleController.text,
      "Category_name": _CategoryController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Discription": _DiscriptionController.text,
      "Date": _datecontroller.text,
      "Time": DateTime.now(),
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
              padding: const EdgeInsets.only(top: 35),
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                          controller: _TrustController,
                          decoration: InputDecoration(
                              labelText: 'Trust name',
                              prefixIcon: Icon(
                                Icons.account_box_rounded,
                                color: Colors.redAccent[200],
                                size: 40,
                              ),
                              hintText: 'Trust Name'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8, top: 20, left: 8),
                        child: TextField(
                          controller: _datecontroller,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.redAccent[200],
                                size: 40,
                              ),
                              labelText: 'Select Date'),
                          onTap: () async {
                            DateTime? picketdate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2200));
                            if (picketdate != null) {
                              setState(() {
                                _datecontroller.text =
                                    DateFormat('dd-MM-yyyy').format(picketdate);
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _PhoneNoController,
                          decoration: InputDecoration(
                              labelText: 'Phone No',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: '1234567890'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _CategoryController,
                          decoration: InputDecoration(
                              labelText: 'Category',
                              prefixIcon: Icon(
                                Icons.food_bank_rounded,
                                color: Colors.redAccent,
                                size: 40,
                              ),
                              hintText: 'Veg or Non-Veg'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30.0, right: 8, left: 8),
                        child: TextFormField(
                          controller: _MealController,
                          decoration: InputDecoration(
                            hintText: "breakfast/lunch/Dinner/Snack",
                            labelText: 'Food Type',
                            prefixIcon: Icon(
                              Icons.fastfood_rounded,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30.0, right: 8, left: 8),
                        child: TextFormField(
                          controller: _PeopleController,
                          decoration: InputDecoration(
                            labelText: 'Number of People',
                            hintText: 'Eg: 120 or 200',
                            prefixIcon: Icon(
                              Icons.people,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30.0, right: 8, left: 8),
                        child: TextFormField(
                          controller: _DiscriptionController,
                          decoration: InputDecoration(
                            labelText: 'About the event',
                            prefixIcon: Icon(
                              Icons.description_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30.0, left: 8),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_TrustController.text != '' &&
                                  _PhoneNoController.text != '' &&
                                  _CategoryController.text != '' &&
                                  _DiscriptionController.text != '' &&
                                  _MealController.text != '' &&
                                  _datecontroller.text != "") {
                                // SendUserDataToDB();
                                CommonDb();
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
