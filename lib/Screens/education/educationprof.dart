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
          title: Text("Student Name : " + widget.value['Name']),
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
                  "Name of the Student :" + widget.value['Name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Phone No :" + widget.value['PhoneNumber'],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Education Request : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Education_List'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Institution Name : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Institution_name'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Address of the student : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Address'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Discription of the student: ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                widget.value['description'],
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
                          .collection("Food_Req_List")
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
