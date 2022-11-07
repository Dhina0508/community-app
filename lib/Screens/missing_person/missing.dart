import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/clothes/clothesreg.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/missing_person/missing_reg.dart';
import 'package:ecyc/Screens/missing_person/missingprof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Missing extends StatefulWidget {
  const Missing({Key? key}) : super(key: key);

  @override
  State<Missing> createState() => _profileState();
}

class _profileState extends State<Missing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blueAccent,
        title: Text('Missing Person List'),
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/missing.png',
          color: Colors.white.withOpacity(0.1),
          colorBlendMode: BlendMode.modulate,
        )),
        StreamBuilder<QuerySnapshot>(
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
                    if (x['about'] == "missing") {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                x['img'],
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          title: Text(
                            "Name: " + x['Name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text("Ph.No: " + x['PhoneNumber']),
                          onTap: () => [
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Missingprof(
                                        value: snapshot.data!.docs[i])))
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  });
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Missingreg()));
        },
      ),
    );
  }
}
