import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection("User_Bio_Data");

    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
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
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_sharp,
                    size: 150,
                    color: Colors.red[200],
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "User Name: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text("${data['Name']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "User PhNo: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text("${data['PhoneNumber']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "User Email :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text("${data['Email']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("User Blood Group: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("${data['Blood']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("User Occupation: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("${data['Occupation']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("User Address: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("${data['Address']}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () =>
                          [Navigator.of(context).pushNamed('update')],
                      child: Text('Update', style: TextStyle(fontSize: 20)))
                ],
              ));
            }

            return Center(child: Text("loading"));
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