import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/bloodprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _profileState();
}

class _profileState extends State<food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Request List'),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('foodreg')],
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Food_Req_List")
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
                              Icons.food_bank_rounded,
                              size: 45,
                              color: Colors.amber,
                            ),
                            Text(
                              x['Meal'],
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        title: Text(
                          "Trust Name: " + x['Trust Name'],
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
