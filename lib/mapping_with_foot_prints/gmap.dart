import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class gmap extends StatefulWidget {
  const gmap({Key? key}) : super(key: key);

  @override
  State<gmap> createState() => _gmapState();
}

class _gmapState extends State<gmap> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(23.1, 78.7), zoom: 4.8);

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
              color: Color.fromRGBO(28, 11, 67, 0.9),
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
        ));
  }
}
