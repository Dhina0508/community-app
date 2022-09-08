import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/bloodprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        actions: [
          IconButton(
              onPressed: () =>
                  [Navigator.of(context).pushNamed('educationreg')],
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
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
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.school_rounded,
                              size: 35,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              x['Institution_name'],
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        title: Text(
                          "Name of the student: " + x['Name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text("Ph.No: " + x['PhoneNumber']),
                        onTap: () => [
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      bloodprof(value: snapshot.data!.docs[i])))
                        ],
                      );
                    });
              })),
    );
  }
}
