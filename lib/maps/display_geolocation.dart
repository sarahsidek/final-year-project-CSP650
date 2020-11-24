import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class DisplayGeolocation extends StatefulWidget {
  @override
  _DisplayGeolocationState createState() => _DisplayGeolocationState();
}

class _DisplayGeolocationState extends State<DisplayGeolocation> {

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void initMarker(specify, specifyId) async{
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(specify['position'].latitude, specify['position'].longitude),
        infoWindow: InfoWindow(title: "Aduan Disini", snippet: specify['address'])
    );
    setState(() {
      markers[markerId] = marker;
      print(specify['Address']);
    });
  }

  getMarkerData() async{
    Firestore.instance.collection("Location").getDocuments().then((myDocData){
      if(myDocData.documents.isNotEmpty) {
        for(int i = 0; i< myDocData.documents.length; i++){
          initMarker(myDocData.documents[i].data, myDocData.documents[i].documentID);
        }
      }
    });
  }

  void initState(){
    getMarkerData();
    super.initState();
  }
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          markers: Set<Marker>.of(markers.values),
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(4.2105, 101.9758),
              zoom: 14.0
          ),
          onMapCreated: (GoogleMapController controller){
            mapController = controller;
          }
      ),
      );
    }
  }