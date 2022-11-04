import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class medicalprof extends StatefulWidget {
  var value;
  medicalprof({this.value});

  @override
  State<medicalprof> createState() => _medicalprofState();
}

class _medicalprofState extends State<medicalprof> {
  launchwp({@required number, @required name}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Help%20You%20$name%20On%20Your%20Medical%20Needs";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }

  var ChatRoomKey;
  var requestor;
  var receiptnt;
  var Email = FirebaseAuth.instance.currentUser!.email;

  ChatRoomId({required email}) async {
    if (Email.toString().length >= email.toString().length) {
      ChatRoomKey = "$Email-$email";
    } else {
      ChatRoomKey = "$email-$Email";
    }
    requestor = Email.toString();
    receiptnt = email.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatRoomId(email: widget.value['email']);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('User_Bio_Data');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(Email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var receiptntName = "Loading.....";
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            receiptntName = data['Name'];
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Requested By: " + widget.value['Name'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cinzel'),
              ),
              backgroundColor: Colors.redAccent,
            ),
            body: Stack(children: [
              Center(
                  child: Image.asset(
                'images/plus.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
              )),
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Patient : ",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.w500,
                              color: Colors.brown),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 15),
                      child: Text(widget.value['Name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Contact : ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                            fontFamily: 'JosefinSans',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 15),
                      child: Text(
                        widget.value['PhoneNumber'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Hospital Name : ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                            fontFamily: 'JosefinSans',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 15),
                      child: Text(
                        widget.value['Hospital_Name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Address: ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                            fontFamily: 'JosefinSans',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 15),
                      child: Text(
                        widget.value['Address'] + '.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'About the person: ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                            fontFamily: 'JosefinSans',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.value['Description'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Email == widget.value['email']
                        ? ElevatedButton(
                            onPressed: () {
                              String id = widget.value['id'];
                              final docUser = FirebaseFirestore.instance
                                  .collection("Common_Db")
                                  .doc(id.toString());
                              docUser.delete();
                              Navigator.of(context).pop();
                            },
                            child: Text('Remove your Request'))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    ChatRoomId(email: widget.value['email']);
                                    print("Chatroom Key: " + ChatRoomKey);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => chatScreen(
                                                  topic: "medical",
                                                  receiptntName: receiptntName,
                                                  requestor: requestor,
                                                  receiptnt: receiptnt,
                                                  chatroomid: ChatRoomKey,
                                                  requestorname:
                                                      widget.value['Your_name'],
                                                )));
                                    // launchwp(
                                    //     number: ("+91" +
                                    //         widget.value['PhoneNumber']),
                                    //     bloodgroup:
                                    //         (widget.value['Blood_Group']));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '   Chat   ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  // minWidth: MediaQuery.of(context).size.width,
                                  // color: Colors.deepOrange,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () =>
                                      [Navigator.of(context).pop()],
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.not_interested_rounded,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Decline',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  // minWidth: MediaQuery.of(context).size.width,
                                  // color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
