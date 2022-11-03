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
                              "Donnor Name: Under Development",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['requestor']),
                            onTap: () => [
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chatScreen(
                                          chatroomid: snapshot.data!.docs[i])))
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
                                          chatroomid: snapshot.data!.docs[i])))
                            ],
                          ),
                        );
                      }
                      return Container();
                    });
              }),
        ));
  }
}
