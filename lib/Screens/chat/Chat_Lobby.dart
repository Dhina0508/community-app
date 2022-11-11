import 'package:ecyc/Screens/ambulence.dart';
import 'package:ecyc/Screens/blood/blood.dart';
import 'package:ecyc/Screens/blood/bloodreg.dart';
import 'package:ecyc/Screens/sos.dart';
import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  var start = "1";
  var Emergency = "";
  var Request = "";
  var Ambulence = "";
  var Sos = "";
  var Blood = "";
  var BloodDonor = "";
  var BloodRequestor = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Ecyc Terminal '),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          start == "1"
              ? ElevatedButton(
                  child: Text("start"),
                  onPressed: () {
                    setState(() {
                      start = "";
                      Emergency = "1";
                      Request = "1";
                    });
                  },
                )
              : Container(),
          Emergency == "1"
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Sos = "1";
                      Ambulence = "1";
                      Request = "";
                      Emergency = "";
                    });
                  },
                  child: Text("Emergency"))
              : Container(),
          Request == "1"
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Sos = "";
                      Ambulence = "";
                      Emergency = "";
                      Request = "";
                      Blood = "1";
                    });
                  },
                  child: Text('Requesst'))
              : Container(),
          Blood == "1"
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Blood = "";
                      BloodDonor = "1";
                      BloodRequestor = "1";
                    });
                  },
                  child: Text("Blood"))
              : Container(),
          BloodDonor == "1"
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Blood = "";
                      BloodDonor = "";
                      BloodRequestor = "";
                      start = "1";
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => blood()));
                  },
                  child: Text("Blood Donnor"))
              : Container(),
          BloodRequestor == "1"
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Blood = "";
                      BloodDonor = "";
                      BloodRequestor = "";
                      start = "1";
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => bloodreg()));
                  },
                  child: Text("Blood Request"))
              : Container(),
          Ambulence == "1"
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AmbulenceService()));
                    setState(() {
                      Ambulence = "";
                      start = "1";
                      Sos = "";
                    });
                  },
                  child: Text("Ambulence"))
              : Container(),
          Sos == "1"
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => sos()));
                    setState(() {
                      Ambulence = "";
                      start = "1";
                      Sos = "";
                    });
                  },
                  child: Text("Sos"))
              : Container()
        ],
      )),
    );
  }
}
