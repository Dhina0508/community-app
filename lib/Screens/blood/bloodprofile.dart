import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class bloodprof extends StatefulWidget {
  var value;
  final count = '0';
  bloodprof({this.value});

  @override
  State<bloodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<bloodprof> {
  launchwp({@required number, @required name, @required bloodgroup}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Donate%20$bloodgroup%20Blood%20Group";
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requested By: " + widget.value['Your_name'],
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
          'images/blood.png',
          color: Colors.white.withOpacity(0.2),
          colorBlendMode: BlendMode.modulate,
        )),
        SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
                                "Patient Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['Name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Blood Needed : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['Blood_Group'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                                'Requested Date : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['Date'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                                ' Patient Address: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              widget.value['Address'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.value['discription'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
                                "Hospital Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['hospital_name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Hospital Address : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['hospital_address'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Requestor Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['Your_name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Requestor Contact Number : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['PhoneNumber'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Spacer(),
                          Email == widget.value['email']
                              ? ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Remove your Request'))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ChatRoomId(
                                              email: widget.value['email']);
                                          print("Chatroom Key: " + ChatRoomKey);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      chatScreen(
                                                        requestor: requestor,
                                                        receiptnt: receiptnt,
                                                        chatroomid: ChatRoomKey,
                                                        name: widget
                                                            .value['Your_name'],
                                                      )));
                                          // launchwp(
                                          //     number: ("+91" +
                                          //         widget.value['PhoneNumber']),
                                          //     bloodgroup:
                                          //         (widget.value['Blood_Group']));
                                          // String id = widget.value['id'];
                                          // print(id);
                                          // final docUser = FirebaseFirestore.instance
                                          //     .collection("Common_Db")
                                          //     .doc(id.toString());
                                          // docUser.delete();
                                          // Navigator.of(context).pop();
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
                  )));
        }))
      ]),
    );
  }
}
