import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController myController;
  Map<MarkerId , Marker> markers = <MarkerId , Marker>{};

  void initMarker(specify, specifyId) async{
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['location'].latitude , specify['location'].longitude),
      infoWindow: InfoWindow(title: 'Im here', snippet: specify['address'])
    );
    setState(() {
      markers[markerId] = marker;
    });
  }
  getMarketData() async {
    Firestore.instance.collection('location').getDocuments().then((myMockData) {
      if(myMockData.documents.isNotEmpty){
        for(int i = 0; i<myMockData.documents.length; i++){
          initMarker(myMockData.documents[i].data, myMockData.documents[i].documentID);
        }
      }
    });
  }

  void initState() {
    getMarketData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker(){
      return <Marker>[
        Marker(
          markerId: MarkerId('I am Here'),
          position: LatLng(3.126613, 101.598443),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Worker')
        )
      ].toSet();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Geolocation'),
          backgroundColor: Colors.redAccent
        ),
        body: GoogleMap(
          markers: getMarker(),
          initialCameraPosition: CameraPosition(
            target: LatLng(3.126613, 101.598443),
            zoom: 14.0),
          onMapCreated: (GoogleMapController controller){
            myController = controller;
          }
        )
      ),
    );
  }
}

