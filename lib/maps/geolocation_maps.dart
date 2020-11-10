import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GeolocationMaps extends StatefulWidget {
  @override
  _GeolocationMapsState createState() => _GeolocationMapsState();
}

class _GeolocationMapsState extends State<GeolocationMaps> {
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true, // Add little blue dot for device location, requires permission from user
              mapType: MapType.hybrid,
              myLocationButtonEnabled: true,
              markers:Set<Marker>.of(markers.values),
          ),
        ]
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        draggable: false,
        markerId: markerId,
        position: LatLng(lat, long),
        zIndex: 2,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        );
    setState(() {
      markers[markerId] = _marker;
    });
  }

  Location location = new Location();

  _animateToUser() async {
    var pos = await location.getLocation();

    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(pos.latitude, pos.latitude),
          zoom: 17.0,
        )
    )
    );
  }
  Future<DocumentReference> _addGeoPoint() async {
    var pos = await location.getLocation();
    GeoFirePoint point = geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore.collection('locations').add({
      'position': point.data,
      'name': 'Yay I can be queried!'
    });
  }
}
