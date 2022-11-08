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
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/plus.png',
          color: Colors.white.withOpacity(0.2),
          colorBlendMode: BlendMode.modulate,
        )),
        SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Common_Db")
                  .orderBy('Time')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      if (x['about'] == "Medical") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.local_hospital_rounded,
                              size: 40,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Patient Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle:
                                Text("Hospital Name: " + x['Hospital_Name']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => medicalprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              }),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.of(context).pushNamed('medicalreg');
        },
      ),
    );
  }
}
