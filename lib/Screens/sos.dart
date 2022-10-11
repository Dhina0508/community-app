import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class sos extends StatefulWidget {
  const sos({super.key});

  @override
  State<sos> createState() => _sosState();
}

class _sosState extends State<sos> {
  final TextEditingController _PoliceNo = TextEditingController();
  final TextEditingController _FireNo = TextEditingController();
  final TextEditingController _WomenNo = TextEditingController();
  final TextEditingController _ChildNo = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _PoliceNo.text = '100';
    _FireNo.text = '101';
    _WomenNo.text = '1091';
    _ChildNo.text = '1098';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'SOS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red,
                fixedSize: const Size(250, 80),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Share my location',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.location_on)
                ],
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red,
                fixedSize: const Size(250, 80),
              ),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_PoliceNo.text);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Contact Police',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.security_rounded)
                ],
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red,
                fixedSize: const Size(250, 80),
              ),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_FireNo.text);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Fire Service',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.fire_extinguisher_rounded)
                ],
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red,
                fixedSize: const Size(250, 80),
              ),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_WomenNo.text);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Women Help Line',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.woman_rounded)
                ],
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red,
                fixedSize: const Size(250, 80),
              ),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_ChildNo.text);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Child Help Line',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(Icons.child_care_rounded)
                ],
              )),
        ],
      )),
    );
  }
}
