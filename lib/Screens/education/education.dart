import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/education/educationprof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../blood/bloodprofile.dart';

class education extends StatefulWidget {
  const education({Key? key}) : super(key: key);

  @override
  State<education> createState() => _profileState();
}

class _profileState extends State<education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('Education Request List'),
        actions: [
          IconButton(
              onPressed: () =>
                  [Navigator.of(context).pushNamed('educationreg')],
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Ink(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 236, 5, 5),
            Color.fromARGB(234, 216, 114, 216),
            Color.fromARGB(236, 91, 19, 159),
            Color.fromARGB(235, 51, 11, 120),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Education_Req_List")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        QueryDocumentSnapshot x = snapshot.data!.docs[i];
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.school_rounded,
                              size: 35,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Name : " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => educationalprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      });
                })),
      ),
    );
  }
}
