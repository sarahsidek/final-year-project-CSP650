import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/Location.dart';
import 'package:fyp/model/Task.dart';
import 'package:fyp/service/database.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart' as geoCo;





class Geolocation extends StatefulWidget {
  final Task task;

  const Geolocation({Key key, this.task}) : super(key: key);

  @override
  _GeolocationState createState() => _GeolocationState(task) ;
}

class _GeolocationState extends State<Geolocation> {
  Task task;
  _GeolocationState(Task task){
    this.task = task;
  }

  GoogleMapController googleMapController;
  List<Marker> _marker = [];
  Position position;
  String addressLocation;
  LocationTask loc;




   getMarkers(double lat, double long) {
     MarkerId markerId = MarkerId(lat.toString() + long.toString());
     setState(() {
       _marker = [];
       _marker.add(Marker(
           markerId: markerId,
           position: LatLng(lat, long),
           zIndex: 2,
           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
           infoWindow: InfoWindow(snippet: "$addressLocation"))
         );
     });
   }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text("Google Maps"),
           backgroundColor: Colors.redAccent,
         ),
          body: Stack(
            children: [
              Center(
                child: GoogleMap(
                    onTap: (tapped) async {
                      getMarkers(tapped.latitude, tapped.longitude);
                      final coordinated = new geoCo.Coordinates(
                          tapped.latitude, tapped.longitude);
                      var address = await geoCo.Geocoder.local
                          .findAddressesFromCoordinates(coordinated);
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final FirebaseUser rd = await auth.currentUser();
                      GeoFirePoint firePoint = new GeoFirePoint(
                          tapped.latitude, tapped.longitude);
                      final String email = rd.email;
                      var firstAddress = address.first;
                      addressLocation = firstAddress.addressLine;
                      DateTime _dateTime = DateTime.now();
                      String id = Firestore.instance.collection("Location").document().documentID;
                      loc = LocationTask(
                          dateTime: _dateTime,
                          email: email,
                          docId: id,
                          address: addressLocation,
                          position: firePoint.geoPoint,
                          noAduan: task.noAduan,
                          kategori: task.kategori,
                          landmark: task.landMark
                      );
                      await DatabaseService().addlocation(loc);
                      Text("Alamat: $addressLocation");
                    },
                    mapType: MapType.normal,
                    compassEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        googleMapController = controller;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(3.1321534083210203, 101.56320049862781),
                        zoom: 15.0),
                    markers: Set.from(_marker)
                ),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Address: $addressLocation",style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                      textAlign: TextAlign.center,
                    )
                ),
              )
            ],
          )

       );
     }
   }