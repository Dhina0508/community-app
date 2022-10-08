import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class scribersprof extends StatefulWidget {
  var value;
  scribersprof({this.value});

  @override
  State<scribersprof> createState() => _scriberprofState();
}

class _scriberprofState extends State<scribersprof> {
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
        backgroundColor: Colors.green,
      ),
      body: Stack(children: [
        Center(
            child: Icon(
          Icons.drive_file_rename_outline_rounded,
          size: 350,
          color: Colors.black12,
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
                    'Exam to be return : ',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Text(
                widget.value['Exam_Group'],
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
      ]),
    );
  }
}
