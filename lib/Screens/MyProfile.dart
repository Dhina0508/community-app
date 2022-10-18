import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _phnoController = new TextEditingController();
  TextEditingController _EmailController = new TextEditingController();
  TextEditingController _BloodController = new TextEditingController();
  TextEditingController _Professionontroller = new TextEditingController();
  TextEditingController _LocationController = new TextEditingController();
  TextEditingController _NameController = new TextEditingController();
  TextEditingController _AgeController = new TextEditingController();

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

  showtoast() {
    Fluttertoast.showToast(
        msg: "Details Cannot Be Empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  UpdateImage() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    var imageFile = FirebaseStorage.instance.ref().child("User").child(name);

    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    var currentuser = _auth.currentUser;

    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({"img": url});
  }

  UpdatePhoneNo() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "PhoneNumber": _phnoController.text,
    });
  }

  UpadateEmail() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "Email": _EmailController.text,
    });
  }

  UpadateAge() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "Age": _AgeController.text,
    });
  }

  UpdateBlood() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "Blood": _BloodController.text,
    });
  }

  UpdateProfession() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "Occupation": _Professionontroller.text,
    });
  }

  UpdateName() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email)
        .update({"Name": _NameController.text});
  }

  UpdateLocation() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("User_Bio_Data");
    return _CollectionReference.doc(currentuser!.email).update({
      "Address": _LocationController.text,
    });
  }

  var name = '';
  var PhNo = '';
  var Email = '';
  var Blood = '';
  var Profession = '';
  var location = '';
  var photo = '';
  var age = '';
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection("User_Bio_Data");

    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Profile',
            style: TextStyle(fontFamily: 'Cinzel', fontSize: 20),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot>(
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
              return SafeArea(
                  minimum: EdgeInsets.only(top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        photo == '1'
                            ? Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: file == null
                                          ? AssetImage("images/profile1.png")
                                          : FileImage(File(file!.path))
                                              as ImageProvider,
                                      radius: 70,
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          photo = '';
                                        });
                                        UpdateImage();
                                      },
                                      child: Text('Update'))
                                ],
                              )
                            : GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                    "${data['img']}",
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    photo = '1';
                                  });
                                },
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Text(
                            "${data['Name']}",
                            style: const TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              name = '1';
                            });
                          },
                        ),
                        name == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Your Name'),
                                      controller: _NameController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_NameController.text != '') {
                                            setState(() {
                                              name = '';
                                            });
                                            UpdateName();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              name = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 20,
                          width: 200,
                          child: Divider(color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  PhNo = '1';
                                });
                              },
                            ),
                            leading: Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            title: Text("${data['PhoneNumber']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Josefinsans')),
                          ),
                        ),
                        PhNo == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Contact Number'),
                                      controller: _phnoController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_phnoController.text != '') {
                                            setState(() {
                                              PhNo = '';
                                            });
                                            UpdatePhoneNo();
                                          } else {
                                            setState(() {
                                              PhNo = '';
                                            });
                                            showtoast();
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.drive_file_rename_outline_rounded,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    Email = '1';
                                  });
                                }),
                            leading: Icon(
                              Icons.email,
                              color: Colors.brown,
                            ),
                            title: Text("${data['Email']}",
                                style: TextStyle(
                                  fontFamily: 'Josefinsans',
                                  fontSize: 20,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Email == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Your Email id'),
                                      controller: _EmailController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_EmailController.text != '') {
                                            setState(() {
                                              Email = '';
                                            });
                                            UpadateEmail();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              Email = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.drive_file_rename_outline_rounded,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age = '1';
                                  });
                                }),
                            leading: Icon(
                              Icons.child_care,
                              color: Colors.black,
                            ),
                            title: Text("${data['Age']}",
                                style: TextStyle(
                                  fontFamily: 'Josefinsans',
                                  fontSize: 20,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        age == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: 'Update Your Age'),
                                      controller: _AgeController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_AgeController.text != '') {
                                            setState(() {
                                              age = '';
                                            });
                                            UpadateAge();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              age = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  Blood = '1';
                                });
                              },
                            ),
                            leading: Icon(
                              Icons.bloodtype,
                              color: Colors.red,
                            ),
                            title: Text("${data['Blood']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Josefinsans')),
                          ),
                        ),
                        Blood == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Your blood Group'),
                                      controller: _BloodController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_BloodController.text != '') {
                                            setState(() {
                                              Blood = '';
                                            });
                                            UpdateBlood();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              Blood = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  Profession = '1';
                                });
                              },
                            ),
                            leading: Icon(
                              Icons.accessibility_rounded,
                              color: Colors.brown,
                            ),
                            title: Text("${data['Occupation']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Josefinsans')),
                          ),
                        ),
                        Profession == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Your Occupation'),
                                      controller: _Professionontroller,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_Professionontroller.text != '') {
                                            setState(() {
                                              Profession = '';
                                            });
                                            UpdateProfession();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              Profession = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  location = '1';
                                });
                              },
                            ),
                            leading: Icon(
                              Icons.location_on_sharp,
                              color: Colors.red,
                            ),
                            title: Text("${data['Address']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Josefinsans')),
                          ),
                        ),
                        location == '1'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Column(
                                  children: [
                                    Card(
                                        child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Update Your Address'),
                                      controller: _LocationController,
                                    )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_LocationController.text != '') {
                                            setState(() {
                                              location = '';
                                            });
                                            UpdateLocation();
                                          } else {
                                            showtoast();
                                            setState(() {
                                              location = '';
                                            });
                                          }
                                        },
                                        child: Text('Update'))
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ));
            }

            return Center(
                child: Text(
              "loading...",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ));
          },
        ));
  }
}
//  Text("User Name: ${data['Name']}"),
//                 Container(child: Text("User Email: ${data['Email']}")),
//                 Text("User Blood Group: ${data['Blood']}"),
//                 Text("User Occupation: ${data['Occupation']}"),
//                 Text("User PhNo: ${data['PhoneNumber']}"),
//                 Text("User Address: ${data['Address']}"),
