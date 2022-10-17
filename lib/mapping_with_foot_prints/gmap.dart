import 'package:ecyc/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class gmap extends StatefulWidget {
  const gmap({Key? key}) : super(key: key);

  @override
  State<gmap> createState() => _gmapState();
}

class _gmapState extends State<gmap> {
  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  @override
  void initState() {
    initalize();
    super.initState();
  }

  initalize() {
    Marker FirstMarker = Marker(
        markerId: MarkerId('Trial1'),
        position: LatLng(13.047411, 80.075922),
        infoWindow: InfoWindow(
            title: 'Panimalar Engineering College', snippet: 'Boys College'),
        onTap: () async {
          var url = "https://panimalar.ac.in/";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw "cannot launch $url";
          }
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker SecondMarker = Marker(
        markerId: MarkerId('Trial2'),
        position: LatLng(13.043362, 80.231425),
        infoWindow: InfoWindow(
          title: 'Earth + Air',
          snippet: 'IT Company',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker ThirdMarker = Marker(
        markerId: MarkerId('Trial3'),
        position: LatLng(13.01, 80.176),
        infoWindow: InfoWindow(
            title: 'Young chennai',
            snippet: 'Best Place',
            onTap: () async {
              var url = "https://en.wikipedia.org/wiki/Tamil_language";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "cannot launch $url";
              }
            }),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    markers.add(FirstMarker);
    markers.add(SecondMarker);
    markers.add(ThirdMarker);
    setState(() {});
  }

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(13.4, 80.1), zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_circle_left_sharp,
              size: 16 * 3,
              color: Color.fromARGB(249, 226, 41, 50),
            ),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          markers: markers.map((e) => e).toSet(),
        ));
  }
}
