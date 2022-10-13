import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class medicalprof extends StatefulWidget {
  var value;
  medicalprof({this.value});

  @override
  State<medicalprof> createState() => _medicalprofState();
}

class _medicalprofState extends State<medicalprof> {
  launchwp({@required number, @required name}) async {
    var url =
        "https://api.whatsapp.com/send?phone=$number&text=I'm%20Willing%20To%20Help%20You%20$name%20On%20Your%20Medical%20Needs";

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
          'images/plus.png',
          color: Colors.white.withOpacity(0.2),
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
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 15),
                child: Text(widget.value['Name'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    'Contact : ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 15),
                child: Text(
                  widget.value['PhoneNumber'],
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
                    'Hospital Name : ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 15),
                child: Text(
                  widget.value['Hospital_Name'],
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
                    'Address: ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 15),
                child: Text(
                  widget.value['Address'] + '.',
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
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.value['Description'],
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
                        launchwp(
                            number: ("+91" + widget.value['PhoneNumber']),
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
