import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/blood/bloodprofile.dart';
import 'package:ecyc/Screens/books/books_profile.dart';
import 'package:ecyc/Screens/clothes/clothesprof.dart';
import 'package:ecyc/Screens/education/educationprof.dart';
import 'package:ecyc/Screens/food/foodprof.dart';
import 'package:ecyc/Screens/medical/medicalprof.dart';
import 'package:ecyc/Screens/missing_person/missingprof.dart';
import 'package:ecyc/Screens/scribers/scriberprofile.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 191, 191),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/ecyc.png',
            color: Colors.white.withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
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
                              "Name: " + x['Your_name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['PhoneNumber']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => medicalprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "blood") {
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
                              "Name: " + x['Your_name'],
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
                      } else if (x['about'] == "food") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.food_bank_rounded,
                              size: 45,
                              color: Colors.amber,
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
                                      builder: (context) => foodprof(
                                          value: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      } else if (x['about'] == "scribers") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(
                              Icons.drive_file_rename_outline_rounded,
                              size: 45,
                              color: Colors.green,
                            ),
                            title: Text(
                              "Name: " + x['Your_name'],
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
                      } else if (x['about'] == "education") {
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
                      } else if (x['about'] == "cloth") {
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
                              "Name: " + x['Your_name'],
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
                      } else if (x['about'] == "missing") {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  x['img'],
                                  fit: BoxFit.fill,
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            title: Text(
                              "Name: " + x['Your_name'],
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
                      } else if (x['about'] == "books") {
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
                      }
                      return Container();
                    });
              }),
        ],
      ),
    );
  }
}
