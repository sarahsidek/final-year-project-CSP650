
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart' as geoCo;



class Geolocation extends StatefulWidget {
  @override
  _GeolocationState createState() => _GeolocationState() ;
}

class _GeolocationState extends State<Geolocation> {


  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position position;
  String addressLocation;

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: addressLocation));
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentLocation() async {
    Position currentPosition =
    await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body:  Stack(
        children: [
          GoogleMap(
              onTap: (tapped) async {
                final coordinated = new geoCo.Coordinates(
                    tapped.latitude, tapped.longitude);
                final FirebaseAuth auth = FirebaseAuth.instance;
                final FirebaseUser rd = await auth.currentUser();
                final uid = rd.uid;
                final String email = rd.email;
                var address = await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);
                var firstAddress = address.first;
                addressLocation = firstAddress.addressLine;
                print(addressLocation);
                getMarkers(tapped.latitude, tapped.longitude);
                await Firestore.instance
                    .collection('Location').document().setData({
                  'latitude': tapped.latitude,
                  'longitude': tapped.longitude,
                  'Address': firstAddress.addressLine,
                  'uid' : uid,
                  'email' : email
                });
              },
              mapType: MapType.normal,
              compassEnabled: true,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  googleMapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(4.2105,101.9758),
                  zoom: 15.0),
              markers: Set<Marker>.of(markers.values)
          ),
          Text("Address: $addressLocation"),
        ],
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


