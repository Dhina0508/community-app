import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class clothesprof extends StatefulWidget {
  var value;
  clothesprof({this.value});

  @override
  State<clothesprof> createState() => _clothesprofState();
}

class _clothesprofState extends State<clothesprof> {
  launchwp({@required number, @required message}) async {
    var url = "https://wa.me/$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Donated By: " + widget.value['Name'],
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cinzel'),
          ),
          //  backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Center(
              child: Image.asset(
            'images/cloth.png',
            color: Colors.white.withOpacity(0.1),
            colorBlendMode: BlendMode.modulate,
          )),
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
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Name : ",
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
                                  'Type of Dress : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinSans',
                                      color: Colors.brown),
                                ),
                              ],
                            ),
                            Text(
                              widget.value['Type_of_dress'],
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
                                  'Number of Dresses Available : ',
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
                                widget.value['No_of_Clothes'],
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
                                  'Information About Dress : ',
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
                                widget.value['Description'],
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
                                  'Contact : ',
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
                                  'Address : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinSans',
                                      color: Colors.brown),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15),
                              child: Text(
                                widget.value['Address'] + '.',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      launchwp(
                                          number: ("+91" +
                                              widget.value['PhoneNumber']),
                                          message:
                                              "Hi, i accepted your blood request :)");
                                      String id = widget.value['id'];
                                      print(id);
                                      final docUser = FirebaseFirestore.instance
                                          .collection("Common_Db")
                                          .doc(id.toString());
                                      docUser.delete();

                                      Navigator.of(context).pop();
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
                                          'Accept',
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
          })
        ]));
  }
}
