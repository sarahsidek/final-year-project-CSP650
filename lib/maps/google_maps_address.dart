import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String addressLocation;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(4.2105, 101.9758),
    zoom: 15.00,
  );

  void updateMarker(LocationData locationData) {
    LatLng latLng = LatLng(locationData.latitude, locationData.longitude);
    this.setState(() {
      marker = Marker(
        markerId: MarkerId("Im here"),
        position: latLng,
        rotation: locationData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),);
    });
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();
      updateMarker(location);

      if (_streamSubscription != null) {
        _streamSubscription.cancel();
      }
      _streamSubscription = _locationTracker.onLocationChanged.listen((locationData) {
        if (googleMapController != null) {
          googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(new CameraPosition(
                  bearing: 192.83,
                  target: LatLng(
                      locationData.latitude, locationData.longitude),
                  tilt: 0,
                  zoom: 10.00)));
          updateMarker(locationData);
        }
      });
    } on PlatformException catch (e) {
      if(e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }
  @override
  void dispose(){
    if (_streamSubscription != null){
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
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker!= null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: (){
          getCurrentLocation();
        },
      ),
    );
  }

}