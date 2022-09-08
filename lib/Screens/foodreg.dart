import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  SendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("Food_Req_List");
    return _CollectionReference.doc().set({
      "Trust Name": _TrustController.text,
      "Meal": _MealController.text,
      "Pepole_List": _PeopleController.text,
      "Category_name": _CategoryController.text,
      "PhoneNumber": _PhoneNoController.text,
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
                'Fill up the Details',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Submit to post request',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent[200],
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, top: 30, left: 8),
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
                    padding: const EdgeInsets.only(right: 8, top: 30, left: 8),
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
                    padding: const EdgeInsets.only(right: 8, top: 30, left: 8),
                    child: TextFormField(
                      controller: _CategoryController,
                      decoration: InputDecoration(
                          labelText: 'Category',
                          prefixIcon: Icon(
                            Icons.food_bank_rounded,
                            color: Colors.amber,
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
                        labelText: 'Meal',
                        prefixIcon: Icon(
                          Icons.fastfood_rounded,
                          color: Colors.amber,
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
        ));
  }
}
