import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class blood extends StatefulWidget {
  const blood({Key? key}) : super(key: key);

  @override
  State<blood> createState() => _profileState();
}

class _profileState extends State<blood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.redAccent,
        title: Text(
          'Blood Request List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('bloodreg')],
              icon: Icon(Icons.add))
        ],
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/blood.png',
          color: Colors.white.withOpacity(0.3),
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
                    if (x['about'] == "blood") {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bloodtype_rounded,
                                size: 45,
                                color: Colors.red,
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
                                    builder: (context) => bloodprof(
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
    );
  }
}
