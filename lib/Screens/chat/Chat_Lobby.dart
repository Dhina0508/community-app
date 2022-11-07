import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
        ),
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Chats")
                  .orderBy('Time')
                  .snapshots(),
              builder: (context, snapshot) {
                var Email = FirebaseAuth.instance.currentUser!.email;
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      if (x['about'] == "blood") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.bloodtype,
                                size: 40,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Donnor Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.bloodtype,
                                size: 40,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Patient Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "medical") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.local_hospital_rounded,
                                size: 40,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Supporter Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.local_hospital_rounded,
                                size: 40,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Patient Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "food") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.food_bank_rounded,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              title: Text(
                                "Supporter Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.food_bank_rounded,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              title: Text(
                                "Requestor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "cloth") {
                        if (x['receiptnt'] == Email) {
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
                                "Receiver Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
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
                                "Cloth Donnor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "education") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.school_rounded,
                                size: 35,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Helper Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.school_rounded,
                                size: 35,
                                color: Colors.red,
                              ),
                              title: Text(
                                "Requestor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "books") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.menu_book_rounded,
                                size: 35,
                                color: Colors.brown,
                              ),
                              title: Text(
                                "Receiver Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.menu_book_rounded,
                                size: 35,
                                color: Colors.brown,
                              ),
                              title: Text(
                                "Donor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "scriber") {
                        if (x['receiptnt'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                size: 35,
                                color: Colors.green,
                              ),
                              title: Text(
                                "Helper Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                size: 35,
                                color: Colors.green,
                              ),
                              title: Text(
                                "Requestor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      } else if (x['about'] == "missing") {
                        if (x['receiptnt'] == Email) {
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
                                "Helper Name: " + x['receiptntName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        } else if (x['requestor'] == Email) {
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
                                "Requestor Name: " + x['requestorName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("Message"),
                              onTap: () => [
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chatScreen(
                                            chatroomid:
                                                snapshot.data!.docs[i])))
                              ],
                            ),
                          );
                        }
                      }
                      return Container();
                    });
              }),
        ));
  }
}
