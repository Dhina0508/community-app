import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class booksreg extends StatefulWidget {
  booksreg({Key? key}) : super(key: key);

  @override
  State<booksreg> createState() => _registerState();
}

class _registerState extends State<booksreg> {
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

  TextEditingController _YourNameController = TextEditingController();

  TextEditingController _PhoneNoController = TextEditingController();

  TextEditingController _AddressController = TextEditingController();

  TextEditingController _DescriptionController = TextEditingController();

  TextEditingController _EditionController = TextEditingController();

  TextEditingController _Publishcontroller = TextEditingController();

  TextEditingController _AuthorController = TextEditingController();

  TextEditingController _TitleController = TextEditingController();

  TextEditingController _TypeController = TextEditingController();

  var email = FirebaseAuth.instance.currentUser!.email;
  var button = "1";

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
      "about": "books",
      "type": _TypeController.text,
      "Name": _TitleController.text,
      "PhoneNumber": _PhoneNoController.text,
      "Address": _AddressController.text,
      "Description": _DescriptionController.text,
      "Edition": _EditionController.text,
      "Author": _AuthorController.text,
      "publish": _Publishcontroller.text,
      "email": email,
      "Your_name": FirebaseAuth.instance.currentUser?.displayName,
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
                'Fill up the Details of the books',
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
                              ? AssetImage(
                                  "images/book1.png",
                                )
                              : FileImage(File(file!.path)) as ImageProvider,
                          radius: 50,
                        ),
                      ),
                      Text('Click to add Image'),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _YourNameController,
                          decoration: InputDecoration(
                              labelText: 'Your Name',
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
                          controller: _TitleController,
                          decoration: InputDecoration(
                              labelText: 'Title of the book',
                              prefixIcon: Icon(
                                Icons.menu_book_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'The Holy Bible'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _AuthorController,
                          decoration: InputDecoration(
                              labelText: 'Author',
                              prefixIcon: Icon(
                                Icons.edit,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: "David"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _Publishcontroller,
                          decoration: InputDecoration(
                              labelText: 'Publisher',
                              prefixIcon: Icon(
                                Icons.people,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'King James'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _EditionController,
                          decoration: InputDecoration(
                              labelText: 'Edition Or Year',
                              prefixIcon: Icon(
                                Icons.done_all_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: 2002'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 30, left: 8),
                        child: TextFormField(
                          controller: _TypeController,
                          decoration: InputDecoration(
                              labelText: 'Type of book',
                              prefixIcon: Icon(
                                Icons.note,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: Religious'),
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
                                Icons.note_add_sharp,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Eg: New Bible'),
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
                                Icons.home_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                              hintText: 'Karayanchavadi Chennai'),
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
                          padding: const EdgeInsets.only(
                              right: 8, top: 30.0, left: 8),
                          child: button == "1"
                              ? ElevatedButton(
                                  onPressed: () {
                                    if (_YourNameController.text != '' &&
                                        _PhoneNoController.text != '' &&
                                        _AddressController.text != '' &&
                                        _AuthorController.text != '' &&
                                        _TitleController.text != '' &&
                                        _TitleController.text != '' &&
                                        _DescriptionController.text != '' &&
                                        _TypeController.text != '') {
                                      //  SendUserDataToDB();
                                      Center(
                                        child: CircularProgressIndicator(),
                                      );
                                      CommonDb();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Error : Details cannot be empty"),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  },
                                  child: Text('   Submit   '))
                              : ElevatedButton(
                                  onPressed: () => [],
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Posting....'),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )))
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
