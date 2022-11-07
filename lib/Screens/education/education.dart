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
      appBar: AppBar(
        title: Text('Education Request List'),
        backgroundColor: Colors.red,
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/book.png',
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

                      if (x['about'] == "education") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.school_rounded,
                              size: 35,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Name : " + x['Your_name'],
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
                      } else {
                        return Container();
                      }
                    });
              }),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).pushNamed('educationreg');
        },
      ),
    );
  }
}
