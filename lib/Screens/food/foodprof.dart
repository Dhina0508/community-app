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
          title: Text("Trust: " + widget.value['Trust Name']),
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
                  "Name of the trust :" + widget.value['Trust Name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Meal Needed : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Category_name'],
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
                'About the Event : ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                widget.value['Discription'],
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
