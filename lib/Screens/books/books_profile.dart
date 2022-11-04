import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Booksprof extends StatefulWidget {
  var value;
  Booksprof({this.value});

  @override
  State<Booksprof> createState() => _clothesprofState();
}

class _clothesprofState extends State<Booksprof> {
  launchwp({@required number, @required book}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Accept%20Your%20Book%20$book";
    ;
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
                backgroundColor: Colors.brown,
                title: Text(
                  "Book Name: " + widget.value['Name'],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cinzel'),
                ),
                //  backgroundColor: Colors.transparent,
              ),
              body: Stack(children: [
                Center(
                  child: Center(
                      child: Icon(
                    Icons.menu_book_rounded,
                    size: 350,
                    color: Colors.black12,
                  )),
                ),
                LayoutBuilder(builder:
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
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                      widget.value['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Book Name : ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Text(widget.value['Name'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Author Name : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    widget.value['Author'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
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
                                        'Publishers : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.value['publish'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                        'Year of Publishing : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.value['Edition'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                        'Type Of Book : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    widget.value['type'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
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
                                        'Description : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    widget.value['Description'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
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
                                        'Book Donor Name : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15),
                                    child: Text(
                                      widget.value['Your_name'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                        'Book Donor PhNo : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15),
                                    child: Text(
                                      widget.value['PhoneNumber'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                        'Book Donor Address : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15),
                                    child: Text(
                                      widget.value['Address'],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Email == widget.value['email']
                                      ? ElevatedButton(
                                          onPressed: () {
                                            String id = widget.value['id'];
                                            final docUser = FirebaseFirestore
                                                .instance
                                                .collection("Common_Db")
                                                .doc(id.toString());
                                            docUser.delete();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Remove your Request'))
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  ChatRoomId(
                                                      email: widget
                                                          .value['email']);
                                                  print("Chatroom Key: " +
                                                      ChatRoomKey);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              chatScreen(
                                                                topic: "books",
                                                                receiptntName:
                                                                    receiptntName,
                                                                requestor:
                                                                    requestor,
                                                                receiptnt:
                                                                    receiptnt,
                                                                chatroomid:
                                                                    ChatRoomKey,
                                                                requestorname:
                                                                    widget.value[
                                                                        'Your_name'],
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                // minWidth: MediaQuery.of(context).size.width,
                                                // color: Colors.deepOrange,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: () => [
                                                  Navigator.of(context).pop()
                                                ],
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .not_interested_rounded,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Decline',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                })
              ]));
        });
  }
}
