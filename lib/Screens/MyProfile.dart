import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            "${data['img']}",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data['Name']}",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
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
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
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
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
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
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
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
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: ListTile(
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
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.purple),
                            onPressed: () =>
                                [Navigator.of(context).pushNamed('update')],
                            child:
                                Text('Update', style: TextStyle(fontSize: 20)))
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