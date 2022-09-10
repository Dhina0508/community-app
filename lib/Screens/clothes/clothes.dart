import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/clothes/clothesreg.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class clothes extends StatefulWidget {
  const clothes({Key? key}) : super(key: key);

  @override
  State<clothes> createState() => _profileState();
}

class _profileState extends State<clothes> {
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Clothes Request List'),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('clothesreg')],
              icon: Icon(Icons.add))
        ],
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
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Clothes_Req_List")
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
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'images/tshirt.png',
                              width: 25,
                              height: 25,
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
                                  builder: (context) => clothesprof(
                                      value: snapshot.data!.docs[i])))
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
