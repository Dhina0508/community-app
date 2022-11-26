import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/blood/Donorpage.dart';
import 'package:ecyc/Screens/chat/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class bloodprof extends StatefulWidget {
  var value;
  final count = '0';
  bloodprof({this.value});

  @override
  State<bloodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<bloodprof> {
  PostSubmit(
      @required Units, @required ReqUnits, @required GotUnits, @required id) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference _CollectionReference =
        FirebaseFirestore.instance.collection("Blood_Wait_list");
    var units = int.parse(Units);
    var reqUnits = int.parse(ReqUnits);
    var gotUnits = int.parse(GotUnits);

    if (reqUnits >= units) {
      int val = 0;
      val = gotUnits + units;
      if (val <= reqUnits && val != 0)
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DonorPage(
                      email: widget.value['email'],
                      UnitNo: reqUnits,
                      gotReqNo: gotUnits,
                      GetingNo: units,
                      id: widget.value['id'],
                      blood: widget.value['Blood_Group'],
                      val: val,
                    )));
      else {
        return Fluttertoast.showToast(
            msg: "We dont need more",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      return Fluttertoast.showToast(
          msg: "We dont need more",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _Units = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requested By: " + widget.value['Your_name'],
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
          color: Colors.white.withOpacity(0.2),
          colorBlendMode: BlendMode.modulate,
        )),
        SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
                                "Patient Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['Name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Patient UHID : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['UHID'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['Blood_Group'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                                "No of Units Needed : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FirebaseAuth.instance.currentUser?.email !=
                                  widget.value['email']
                              ? Text(widget.value['units'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                              : Row(
                                  children: [
                                    Spacer(),
                                    Text(widget.value['units'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    IconButton(
                                        onPressed: () {
                                          AcceptEdit(@required id,
                                              @required units) async {
                                            final FirebaseAuth _auth =
                                                FirebaseAuth.instance;
                                            CollectionReference
                                                _CollectionReference =
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        "Blood_Wait_list");
                                          }

                                          TextEditingController _Units =
                                              TextEditingController();
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        "Enter the no of units"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller: _Units,
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              final docUser = FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "Blood_Wait_list")
                                                                  .doc(widget
                                                                      .value[
                                                                          'id']
                                                                      .toString());
                                                              docUser.update({
                                                                "units":
                                                                    _Units.text
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text('Update'))
                                                      ],
                                                    ));
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit_rounded,
                                          color: Colors.green,
                                        )),
                                    Spacer()
                                  ],
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
                                "No of Units We got : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['GotUnits'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Requested Date : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['Date'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
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
                                'Reason for Admission: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.value['discription'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
                                "Hospital Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['hospital_name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Hospital Address : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['hospital_address'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Requestor Name : ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.value['Your_name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Requestor Contact Number : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.value['PhoneNumber'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Spacer(),
                          FirebaseAuth.instance.currentUser?.email !=
                                  widget.value['email']
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Enter the no of units"),
                                                  content: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text("We have " +
                                                            widget.value[
                                                                'GotUnits'] +
                                                            "/" +
                                                            widget.value[
                                                                'units']),
                                                        TextField(
                                                          controller: _Units,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            222,
                                                                            81,
                                                                            70)),
                                                            onPressed: () {
                                                              PostSubmit(
                                                                  _Units.text,
                                                                  widget.value[
                                                                      'units'],
                                                                  widget.value[
                                                                      'GotUnits'],
                                                                  widget.value[
                                                                      'id']);
                                                            },
                                                            child:
                                                                Text('Donate'))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
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
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
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
                                              'Nope  ',
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
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    final docUser = FirebaseFirestore.instance
                                        .collection("Blood_Wait_list")
                                        .doc(widget.value['id'].toString());
                                    docUser.delete();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Remove My Request'))
                        ],
                      ),
                    ),
                  )));
        }))
      ]),
    );
  }
}

Future<bool> _acceptbuttonpressed(
    BuildContext context, StateSetter setState) async {
  bool acceptUnits = await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _Units = new TextEditingController();
        final units = [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
        ];
        String? req_units;
        return AlertDialog(
          title: Text(
            'How many Units of Blood,Can you Donate?',
            style: TextStyle(fontSize: 17),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Enter the No of Units"), TextField()],
            ),
          ),
          actions: <Widget>[
            TextButton(onPressed: () {}, child: Text('Donate')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('cancel')),
          ],
        );
      });
  return acceptUnits;
}

DropdownMenuItem<String> buildMenureq_units(String req_units) =>
    DropdownMenuItem(
        value: req_units,
        child: Text(
          req_units,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
