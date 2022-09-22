import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class Missingreg extends StatefulWidget {
  Missingreg({Key? key}) : super(key: key);

  @override
  State<Missingreg> createState() => _registerState();
}

class _registerState extends State<Missingreg> {
  String? link;
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
  TextEditingController _YourNameController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _AddressController = TextEditingController();

  TextEditingController _DescriptionController = TextEditingController();
  TextEditingController _AgeController = TextEditingController();
  TextEditingController _Heightcontroller = TextEditingController();
  TextEditingController _ColourController = TextEditingController();
  TextEditingController _IdentityController = TextEditingController();
  TextEditingController _MissingdateController = TextEditingController();
  TextEditingController _MissingareaController = TextEditingController();

  // SendUserDataToDB() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentuser = _auth.currentUser;
  //   String name = DateTime.now().millisecondsSinceEpoch.toString();
  //   var imageFile = FirebaseStorage.instance.ref().child(name).child("/.jpeg");

  //   UploadTask task = imageFile.putFile(file!);
  //   TaskSnapshot snapshot = await task;
  //   url = await snapshot.ref.getDownloadURL();
  //   final _CollectionReference =
  //       FirebaseFirestore.instance.collection("Missing_Req_List").doc();
  //   return _CollectionReference.set({
  //     "id": _CollectionReference.id,
  //     "Name": _NameController.text,
  //     "PhoneNumber": _PhoneNoController.text,
  //     "Address": _AddressController.text,
  //     "Description": _DescriptionController.text,
  //     "Age": _AgeController.text,
  //     "Colour": _ColourController.text,
  //     "Height": _Heightcontroller.text,
  //     "Identity": _IdentityController.text,
  //     "Missing Date": _MissingdateController.text,
  //     "Missing Area": _MissingareaController.text,
  //     "Your Name": _YourNameController.text,
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
      "id": _CollectionReference.id,
      "about": "missing",
      "Name": _NameController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Address": _AddressController.text,
      "Description": _DescriptionController.text,
      "Age": _AgeController.text,
      "Colour": _ColourController.text,
      "Height": _Heightcontroller.text,
      "Identity": _IdentityController.text,
      "Missing Date": _MissingdateController.text,
      "Missing Area": _MissingareaController.text,
      "Your Name": _YourNameController.text,
      "Time": DateTime.now(),
      "img": url
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
                Navigator.of(context).pop();
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
                              ? AssetImage("images/missing_prof.png")
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
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Enter Name'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _AgeController,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              prefixIcon: Icon(
                                Icons.face_retouching_natural,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: 24'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _Heightcontroller,
                          decoration: InputDecoration(
                              labelText: 'Height',
                              prefixIcon: Icon(
                                Icons.height,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: "Eg: 5 Feet 2 Inches"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _ColourController,
                          decoration: InputDecoration(
                              labelText: 'Colour',
                              prefixIcon: Icon(
                                Icons.color_lens,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: black or white or brown,..'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _IdentityController,
                          decoration: InputDecoration(
                              labelText: 'Identity',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText:
                                  'Eg: A small scare on the forehead or Wear Spex'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _MissingdateController,
                          decoration: InputDecoration(
                              labelText: 'Missed Date',
                              prefixIcon: Icon(
                                Icons.date_range_outlined,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: 12/05/2025'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _MissingareaController,
                          decoration: InputDecoration(
                              labelText: 'Missed Area',
                              prefixIcon: Icon(
                                Icons.home_work,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: sennurkuppam in karaiyanchavadi'),
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
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText:
                                  ' Extra Details about the Missing person'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _AddressController,
                          decoration: InputDecoration(
                              labelText: 'Your Address',
                              prefixIcon: Icon(
                                Icons.home,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: ' Eg: T Nagar'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _YourNameController,
                          decoration: InputDecoration(
                              labelText: 'Your Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Name of the Requesting Person'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30.0, right: 8, left: 8),
                        child: TextFormField(
                          controller: _PhoneNoController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: ' Your Contact Number',
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
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
                              if (_NameController.text != '' &&
                                  _PhoneNoController.text != '' &&
                                  _IdentityController.text != '' &&
                                  _AddressController != '' &&
                                  _AgeController != '' &&
                                  _MissingareaController != '' &&
                                  _MissingdateController != '') {
                                //  SendUserDataToDB();
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
