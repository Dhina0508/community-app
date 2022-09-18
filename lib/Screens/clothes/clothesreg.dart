import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class clothesreg extends StatefulWidget {
  clothesreg({Key? key}) : super(key: key);

  @override
  State<clothesreg> createState() => _registerState();
}

class _registerState extends State<clothesreg> {
  ImagePicker image = ImagePicker();
  File? file;

  String url = "";
  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  TextEditingController _NameController = TextEditingController();

  TextEditingController _ClothController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _AddressController = TextEditingController();

  TextEditingController _Num_of_clothController = TextEditingController();

  TextEditingController _DescriptionController = TextEditingController();

  // SendUserDataToDB() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentuser = _auth.currentUser;
  //   String name = DateTime.now().millisecondsSinceEpoch.toString();
  //   var imageFile = FirebaseStorage.instance.ref().child(name).child("/.jpeg");

  //   UploadTask task = imageFile.putFile(file!);
  //   TaskSnapshot snapshot = await task;
  //   url = await snapshot.ref.getDownloadURL();
  //   final _CollectionReference =
  //       FirebaseFirestore.instance.collection("Clothes_Req_List").doc();
  //   return _CollectionReference.set({
  //     "id": _CollectionReference.id,
  //     "Name": _NameController.text,
  //     "Type_of_dress": _ClothController.text,
  //     "PhoneNumber": _PhoneNoController.text,
  //     "Address": _AddressController.text,
  //     "No_of_Clothes": _Num_of_clothController.text,
  //     "Description": _DescriptionController.text,
  //     "img": url
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

  CommonDb() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    var imageFile = FirebaseStorage.instance.ref().child(name).child("/.jpeg");

    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();

    final _CollectionReference =
        FirebaseFirestore.instance.collection("Common_Db").doc();
    return _CollectionReference.set({
      "about": "cloth",
      "id": _CollectionReference.id,
      "Name": _NameController.text,
      "Type_of_dress": _ClothController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Address": _AddressController.text,
      "No_of_Clothes": _Num_of_clothController.text,
      "Description": _DescriptionController.text,
      "img": url,
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('clothes');
              },
              icon: Icon(Icons.arrow_back)),
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
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Submit to Post',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          getImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: file == null
                              ? AssetImage("images/profile1.png")
                              : FileImage(File(file!.path)) as ImageProvider,
                          radius: 50,
                        ),
                      ),
                      Text('Click to add Image'),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _NameController,
                          decoration: InputDecoration(
                              labelText: 'Full name',
                              prefixIcon: Icon(
                                Icons.account_box_rounded,
                                color: Color.fromARGB(255, 41, 155, 173),
                                size: 40,
                              ),
                              hintText: 'Enter Name'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _ClothController,
                          decoration: InputDecoration(
                              labelText: 'Type of Dress',
                              prefixIcon: Image.asset(
                                'images/tshirt.png',
                                width: 15,
                                height: 15,
                              ),
                              hintText: 'Eg: T-Shirt,Shirt,Pant,..'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _Num_of_clothController,
                          decoration: InputDecoration(
                              labelText: 'Number of Dresses',
                              prefixIcon: Icon(
                                Icons.collections,
                                color: Color.fromARGB(255, 41, 155, 173),
                                size: 40,
                              ),
                              hintText: 'Eg: 10 Shirt, 40 T-Shirt,...'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _DescriptionController,
                          decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: Icon(
                                Icons.note_alt,
                                color: Color.fromARGB(255, 41, 155, 173),
                                size: 40,
                              ),
                              hintText: 'Details about Donating Dress'),
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
                              color: Color.fromARGB(255, 41, 155, 173),
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
                                color: Color.fromARGB(255, 41, 155, 173),
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
                              if (_NameController.text != '' &&
                                  _PhoneNoController.text != '' &&
                                  _AddressController.text != '' &&
                                  _Num_of_clothController.text != '' &&
                                  _ClothController.text != '') {
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
