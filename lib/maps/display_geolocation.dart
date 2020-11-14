import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DisplayGeolocation extends StatefulWidget {
  @override
  _DisplayGeolocationState createState() => _DisplayGeolocationState();
}

class _DisplayGeolocationState extends State<DisplayGeolocation> {


  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void iniMarker(specify, specifyId) async{
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['latitude'].latitude, specify['longitude'].longitude),
      infoWindow: InfoWindow(title: "Im Here", snippet: specify['Address'])
    );
    setState(() {
      markers[markerId] = marker;
    });
  }
  getMarkerData() async{
    Firestore.instance.collection("Task").getDocuments().then((myDocData){
      if(myDocData.documents.isNotEmpty) {
        for(int i = 0; i< myDocData.documents.length; i++){
           iniMarker(myDocData.documents[i].data, myDocData.documents[i].documentID);
        }
      }
    });
  }

  void initState(){
    getMarkerData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   Set<Marker> getMarker(){
     return <Marker>[
       Marker(
         markerId: MarkerId("Pegawai Merekod"),
         position: LatLng(4.2105, 101.9758),
         icon: BitmapDescriptor.defaultMarker,
         infoWindow: InfoWindow(title: "Here"),
       )
     ].toSet();
   }
   GoogleMapController mapController;
    return Scaffold(
     body: GoogleMap(
       markers: getMarker(),
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
