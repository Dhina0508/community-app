import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class medicalprof extends StatefulWidget {
  var value;
  medicalprof({this.value});

  @override
  State<medicalprof> createState() => _medicalprofState();
}

class _medicalprofState extends State<medicalprof> {
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
                  'Hospital Name : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Hospital_Name'],
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
                widget.value['Description'],
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
                          .collection("medical_Req_List")
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
