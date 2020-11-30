import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/model/Location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class GoogleMaps extends StatefulWidget {


  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {

  StreamSubscription _streamSubscription;
  GoogleMapController googleMapController;
  Location _locationTracker = new Location();
  Marker marker;
  Circle circle;
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
      updateMarker(location);

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
        title: Text("Google Maps"),
        backgroundColor: Colors.redAccent,
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
            top: 10.0,
            left: 10.0,
            child: Container(
                height: 125,
                width: MediaQuery.of(context).size.width,
                child: Text("Your Tasks:",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                  textAlign: TextAlign.center,
                )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          getCurrentLocation();
        },
      ),
    );
  }

}
