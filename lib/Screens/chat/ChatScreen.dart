import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var loginuser = FirebaseAuth.instance.currentUser;

class chatScreen extends StatefulWidget {
  var chatroomid;
  var requestorname;
  var requestor;
  var receiptnt;
  var receiptntName;
  var topic;
  var img;

  chatScreen(
      {this.chatroomid,
      this.requestorname,
      this.requestor,
      this.receiptnt,
      this.receiptntName,
      this.img,
      this.topic});
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
      "requestorName": widget.requestorname,
      "receiptntName": widget.receiptntName,
      "receiptnt": widget.receiptnt.toString(),
      "chatroomid": widget.chatroomid.toString(),
      "img": widget.img,
      "Time": DateTime.now().toString(),
      "about": widget.topic
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.requestorname == null) {
      UpdateTime() {
        CollectionReference _CollectionReference =
            FirebaseFirestore.instance.collection("Chats");
        return _CollectionReference.doc(widget.chatroomid['chatroomid'])
            .update({"Time": DateTime.now().toString()});
      }

      CollectionReference users =
          FirebaseFirestore.instance.collection('User_Bio_Data');
      return Scaffold(
        appBar: AppBar(
            title: Text(widget.chatroomid['receiptnt'] == email
                ? widget.chatroomid['receiptntName']
                : widget.chatroomid['requestorName'])),
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
    } else {
      setState(() {
        UpdateDetails();
      });

      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.requestorname,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
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
                                                ? Color.fromARGB(
                                                    255, 199, 58, 224)
                                                : Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: email == x['User']
                                                ? Text(
                                                    x['Messgaes'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    x['Messgaes'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )))),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  controller: _MessageController,
                  textAlignVertical: TextAlignVertical.center,
                  autofocus: true,
                  decoration: InputDecoration(
                      fillColor: Colors.green[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "  Message....",
                      suffixIcon: IconButton(
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
            ),
          ],
        ),
      );
    }
  }
}
