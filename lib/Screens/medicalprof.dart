import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class medicalprof extends StatefulWidget {
  var value;
  medicalprof({this.value});

  @override
  State<medicalprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<medicalprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Patient: " + widget.value['Name']),
          backgroundColor: Colors.red,
        ),
        body: Column(
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
                  "Name of the person :" + widget.value['Name'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Blood Needed : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Blood_Group'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'About the person:-',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                widget.value['discription'],
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("Blood_Req_List")
                          .doc()
                          .delete();

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
        ));
  }
}
