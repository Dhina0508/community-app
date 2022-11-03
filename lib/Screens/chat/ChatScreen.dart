import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var loginuser = FirebaseAuth.instance.currentUser;

class chatScreen extends StatefulWidget {
  var chatroomid;
  var name;
  var requestor;
  var receiptnt;

  chatScreen({this.chatroomid, this.name, this.requestor, this.receiptnt});
  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  TextEditingController _MessageController = new TextEditingController();
  final storemessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  var email = FirebaseAuth.instance.currentUser!.email;

  UpdateDetails() {
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("Chats");
    return _CollectionReference.doc(widget.chatroomid).set({
      "requestor": widget.requestor.toString(),
      "requestorName": widget.name,
      "receiptnt": widget.receiptnt.toString(),
      "chatroomid": widget.chatroomid.toString(),
      "Time": DateTime.now().toString()
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name == null) {
      UpdateTime() {
        CollectionReference _CollectionReference =
            FirebaseFirestore.instance.collection("Chats");
        return _CollectionReference.doc(widget.chatroomid['chatroomid'])
            .update({"Time": DateTime.now().toString()});
      }

      CollectionReference users =
          FirebaseFirestore.instance.collection('User_Bio_Data');
      return FutureBuilder<DocumentSnapshot>(
        future: users
            .doc(widget.chatroomid['receiptnt'] == email
                ? widget.chatroomid['requestor']
                : widget.chatroomid['receiptnt'])
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var name = "Loading.....";
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            name = data['Name'];
          }

          return Scaffold(
            appBar: AppBar(title: Text(name.toString())),
            body: Column(
              children: [
                Expanded(
                    child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Chats")
                          .doc(widget.chatroomid['chatroomid'])
                          .collection("messages")
                          .orderBy('time')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            primary: true,
                            itemBuilder: (context, i) {
                              QueryDocumentSnapshot x = snapshot.data!.docs[i];
                              return ListTile(
                                title: Column(
                                  crossAxisAlignment: email == x['User']
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    SafeArea(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: email == x['User']
                                                    ? Colors.redAccent[100]
                                                    : Colors
                                                        .lightBlueAccent[100],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                x['Messgaes'],
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ))),
                                    Text(
                                      x['User'],
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                )),
                Card(
                  color: Colors.amber[100],
                  child: TextFormField(
                    controller: _MessageController,
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Send A Message",
                        suffix: IconButton(
                            onPressed: () {
                              if (_MessageController.text.isNotEmpty) {
                                storemessage
                                    .collection("Chats")
                                    .doc(widget.chatroomid['chatroomid'])
                                    .collection("messages")
                                    .doc()
                                    .set({
                                  "Messgaes": _MessageController.text.trim(),
                                  "User": email,
                                  'time': DateTime.now()
                                });
                                _MessageController.clear();
                                UpdateTime();
                              }
                            },
                            icon: Icon(Icons.send))),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      setState(() {
        UpdateDetails();
      });

      return Scaffold(
        appBar: AppBar(title: Text(widget.name)),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Chats")
                      .doc(widget.chatroomid)
                      .collection("messages")
                      .orderBy('time')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, i) {
                          QueryDocumentSnapshot x = snapshot.data!.docs[i];
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: email == x['User']
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                SafeArea(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: email == x['User']
                                                ? Colors.redAccent[100]
                                                : Colors.lightBlueAccent[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            x['Messgaes'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))),
                                Text(
                                  x['User'],
                                  style: TextStyle(fontSize: 8),
                                )
                              ],
                            ),
                          );
                        });
                  }),
            )),
            Card(
              color: Colors.amber[100],
              child: TextFormField(
                controller: _MessageController,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Send A Message",
                    suffix: IconButton(
                        onPressed: () {
                          if (_MessageController.text.isNotEmpty) {
                            storemessage
                                .collection("Chats")
                                .doc(widget.chatroomid)
                                .collection("messages")
                                .doc()
                                .set({
                              "Messgaes": _MessageController.text.trim(),
                              "User": email,
                              'time': DateTime.now()
                            });
                            _MessageController.clear();
                          }
                        },
                        icon: Icon(Icons.send))),
              ),
            ),
          ],
        ),
      );
    }
  }
}
