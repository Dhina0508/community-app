import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/scribers/scriberprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';

class scribers extends StatefulWidget {
  const scribers({Key? key}) : super(key: key);

  @override
  State<scribers> createState() => _profileState();
}

class _profileState extends State<scribers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.green,
        title: Text(
          'Scribers Request List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('scribersreg')],
              icon: Icon(Icons.add))
        ],
      ),
      body: Stack(children: [
        Center(
            child: Icon(
          Icons.drive_file_rename_outline_rounded,
          size: 350,
          color: Colors.black12,
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
                      if (x['about'] == "scribers") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.drive_file_rename_outline_rounded,
                              size: 35,
                              color: Colors.green,
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
                                      builder: (context) => scribersprof(
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
    );
  }
}
