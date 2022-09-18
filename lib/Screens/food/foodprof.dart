import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class foodprof extends StatefulWidget {
  var value;
  foodprof({this.value});

  @override
  State<foodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<foodprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
