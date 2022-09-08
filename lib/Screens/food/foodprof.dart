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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Requested By: " + widget.value['Trust Name'],
            style: TextStyle(fontFamily: 'Cinzel'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Ink(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 236, 5, 5),
              Color.fromARGB(234, 216, 114, 216),
              Color.fromARGB(236, 91, 19, 159),
              Color.fromARGB(235, 51, 11, 120),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: SafeArea(
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
                            color: Colors.white),
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
                            color: Colors.white),
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
                            color: Colors.white),
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
                            color: Colors.white),
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
                            color: Colors.white),
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
                            color: Colors.white),
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
              ),
            ),
          ),
        ));
  }
}
