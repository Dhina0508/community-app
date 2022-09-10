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
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Name: ${data['Name']}"),
                Container(child: Text("User Email: ${data['Email']}")),
                Text("User Blood Group: ${data['Blood']}"),
                Text("User Occupation: ${data['Occupation']}"),
                Text("User PhNo: ${data['PhoneNumber']}"),
                Text("User Address: ${data['Address']}"),
                ElevatedButton(
                    onPressed: () =>
                        [Navigator.of(context).pushNamed('update')],
                    child: Text('Update'))
              ],
            ),
          );
        }

        return Center(child: Text("loading"));
      },
    ));
  }
}
