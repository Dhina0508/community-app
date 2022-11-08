import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class foodprof extends StatefulWidget {
  var value;
  foodprof({this.value});

  @override
  State<foodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<foodprof> {
  launchwp({@required number, @required trust}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Donate%20For%20Your%20Trust%20$trust";

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
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => [Navigator.of(context).pop()],
              ),
              title: Text(
                "Requested By: " + widget.value['Trust Name'],
                style: TextStyle(fontFamily: 'Cinzel', color: Colors.black),
              ),
              backgroundColor: Colors.amber,
            ),
            body: Stack(children: [
              Center(
                  child: Image.asset(
                'images/plate.png',
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
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //       height: 200,
                          //       width: 200,
                          //       child: Image.network(widget.value['person_image'])),
                          // ),
                          Text(
                            "Trust Name :",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Trust Name'],
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
                            'Contact No : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['PhoneNumber'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Date of the Event: ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Date'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Category : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Category_name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Food Type : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Meal'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Number of People : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Pepole_List'] + ' People',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'About the Event : ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JosefinSans',
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Text(
                        widget.value['Discription'],
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
                                                    topic: "food",
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
