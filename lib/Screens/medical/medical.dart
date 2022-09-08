import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/medical/medicalprof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../blood/bloodprofile.dart';

class medical extends StatefulWidget {
  const medical({Key? key}) : super(key: key);

  @override
  State<medical> createState() => _profileState();
}

class _profileState extends State<medical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Request List'),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('medicalreg')],
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("medical_Req_List")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_hospital_rounded,
                              size: 40,
                              color: Colors.red,
                            ),
                            Text(
                              x['Hospital_Name'],
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        title: Text(
                          "Patient Name: " + x['Name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text("Ph.No: " + x['PhoneNumber']),
                        onTap: () => [
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => medicalprof(
                                      value: snapshot.data!.docs[i])))
                        ],
                      );
                    });
              })),
    );
  }
}
