import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(3.1280134746906763, 101.59452222802409),
        ),
        markers: Set.from(markers),
        onTap: _handleTap,
      ),
    );
  }
  _handleTap(tapped){
    setState(() {
      markers =[];
      markers.add(Marker(
        markerId: MarkerId(tapped.toString()),
        position: tapped,
      ));
    });
  }
}