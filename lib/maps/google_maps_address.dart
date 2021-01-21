import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/model/CompleteTask.dart';
import 'package:fyp/model/Location.dart';
import 'package:fyp/service/database.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
class GoogleMaps extends StatefulWidget {

  final CompleteTask ctk;

  GoogleMaps({Key key, this.ctk}) : super(key: key);

    @override
  _GoogleMapsState createState() => _GoogleMapsState(ctk);
}

class _GoogleMapsState extends State<GoogleMaps> {
  CompleteTask ctk;
  _GoogleMapsState(CompleteTask ctk){
    this.ctk = ctk;
  }
  LocationTask loc;
  StreamSubscription _streamSubscription;
  GoogleMapController googleMapController;
  Location _locationTracker = new Location();
  Marker marker;
  Circle circle;
  String addressLocation;
  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(4.2105, 101.9758),
    zoom: 18.00,
  );

  void updateMarker(LocationData newLocalData) {
    LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
        markerId: MarkerId("Im here"),
        position: latLng,
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),);
      circle = Circle(
          circleId: CircleId('RADIUS'),
          radius: 500,
          strokeColor: Colors.blue,
          center: latLng,
          fillColor: Colors.blue.withAlpha(80)
      );
    });
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();
      final coordinated = new geoCo.Coordinates(location.latitude, location.longitude);
      var address = await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);
      GeoFirePoint firePoint = new GeoFirePoint(location.latitude, location.longitude);
      var firstAddress = address.first;
      addressLocation = firstAddress.addressLine;
      String id = Firestore.instance.collection("Location").document().documentID;
      loc = LocationTask(
        completeTaskID: ctk.id,
        email: ctk.email,
        docId: id,
        address: addressLocation,
        position: firePoint.geoPoint,
        noAduan: ctk.noAduan,
        kategori: ctk.kategori,
        barang: ctk.barang,
        quantity: ctk.quantity
      );
      DatabaseService().addlocation(loc);
      if (_streamSubscription != null) {
        _streamSubscription.cancel();
      }
      _streamSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
            if (googleMapController != null) {
              googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(new CameraPosition(
                      bearing: 192.83,
                      target: LatLng(
                          newLocalData.latitude, newLocalData.longitude),
                      tilt: 0,
                      zoom: 15.00)));
              updateMarker(newLocalData);
            }
          });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("PETA ",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
          backgroundColor: Colors.blue[800]
      ),
      body: Stack(
        children: [
          Center(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: initialLocation,
              markers: Set.of((marker != null) ? [marker] : []),
              circles: Set.of((circle != null) ? [circle] : []),
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
          ),
          Positioned(
            child: Container(
                height: 150,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2)
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text("LOKASI ANDA:" + "$addressLocation", style: TextStyle(color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        backgroundColor: Colors.blue[800],
        onPressed: () {
        getCurrentLocation();
        },
      ),
    );
  }
}
