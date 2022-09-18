import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class educationalprof extends StatefulWidget {
  var value;
  educationalprof({this.value});

  @override
  State<educationalprof> createState() => _educationalprofprofState();
}

class _educationalprofprofState extends State<educationalprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requested By : " + widget.value['Name'],
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
                  widget.value['Name'],
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
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
                        onPressed: () => [Navigator.of(context).pop()],
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
  }
}
