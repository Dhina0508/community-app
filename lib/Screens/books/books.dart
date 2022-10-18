import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/books/books_profile.dart';
import 'package:ecyc/Screens/bottomnavigationbar.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';

class books extends StatefulWidget {
  const books({Key? key}) : super(key: key);

  @override
  State<books> createState() => _profileState();
}

class _profileState extends State<books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigatorBar()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.brown,
        title: Text(
          'Books Available List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => [Navigator.of(context).pushNamed('booksreg')],
              icon: Icon(Icons.add))
        ],
      ),
      body: Stack(children: [
        Center(
            child: Icon(
          Icons.menu_book_rounded,
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
                      if (x['about'] == "books") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.menu_book_rounded,
                              size: 40,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Book Name: " + x['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Booksprof(
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
