import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bloodprof extends StatefulWidget {
  var value;
  bloodprof({this.value});

  @override
  State<bloodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<bloodprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requested By: " + widget.value['Name'],
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cinzel'),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/blood.png',
          color: Colors.white.withOpacity(0.3),
          colorBlendMode: BlendMode.modulate,
        )),
        SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Patient : ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'JosefinSans',
                        color: Colors.brown),
                  ),
                ],
              ),
              Text(widget.value['Name'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Text(
                widget.value['PhoneNumber'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    'Blood Needed : ',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Text(
                widget.value['Blood_Group'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    'Address: ',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 15),
                child: Text(
                  widget.value['Address'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    'About the person: ',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.value['discription'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          ),
        ),
      ]),
    );
  }
}
