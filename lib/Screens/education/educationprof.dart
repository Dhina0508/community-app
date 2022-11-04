import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class educationalprof extends StatefulWidget {
  var value;
  educationalprof({this.value});

  @override
  State<educationalprof> createState() => _educationalprofprofState();
}

class _educationalprofprofState extends State<educationalprof> {
  launchwp({@required number}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Help%20You%20In%20your%20Education";

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
                "Requested By : " + widget.value['Your_name'],
                style: TextStyle(fontFamily: 'Cinzel'),
              ),
              backgroundColor: Colors.red,
            ),
            body: Stack(children: [
              Center(
                  child: Image.asset(
                'images/book.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
              )),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "Student Name :",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Your_name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Phone No :",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'JosefinSans',
                              color: Colors.brown),
                        ),
                      ),
                      Text(
                        widget.value['PhoneNumber'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Education Request : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Education_List'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Institution Name : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Institution_name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Address of the student : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Address'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Discription of the student: ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['description'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                                                    topic: "education",
                                                    receiptntName:
                                                        receiptntName,
                                                    requestor: requestor,
                                                    receiptnt: receiptnt,
                                                    chatroomid: ChatRoomKey,
                                                    requestorname: widget
                                                        .value['Your_name'],
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
              ),
            ]),
          );
        });
  }
}
