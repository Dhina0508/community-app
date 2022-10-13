import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Missingprof extends StatefulWidget {
  var value;
  Missingprof({this.value});

  @override
  State<Missingprof> createState() => _MissingprofState();
}

class _MissingprofState extends State<Missingprof> {
  launchwp({@required number, @required name}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I%20Guess%20We%20Found%20Your%20Person%20$name";

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
            "Requested by : " + widget.value['Your Name'],
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
            'images/missing.png',
            color: Colors.white.withOpacity(0.08),
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
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              width: 150,
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
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Age : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinSans',
                                      color: Colors.brown),
                                ),
                              ],
                            ),
                            Text(
                              widget.value['Age'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  'Sex : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinSans',
                                      color: Colors.brown),
                                ),
                              ],
                            ),
                            Text(
                              widget.value['Sex'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  'Height : ',
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
                                widget.value['Height'],
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
                                  'Skin Colour : ',
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
                                widget.value['Colour'],
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
                                  'Identity Marks : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'JosefinSans',
                                      color: Colors.brown),
                                ),
                              ],
                            ),
                            Text(
                              widget.value['Identity'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  'Missed Date : ',
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
                                widget.value['Missing Date'],
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
                                  'Missed Area : ',
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
                                widget.value['Missing Area'],
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
                                  'Description : ',
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
                                  'Contact Address : ',
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
                                widget.value['Address'],
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
                                  'Contact Number : ',
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
                                widget.value['PhoneNumber'],
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
                                          name: widget.value['Name']);
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
                                          'Found',
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
                                          'Not found',
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
