import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart' as geoCo;

class Geolocation extends StatefulWidget {
  @override
  _GeolocationState createState() => _GeolocationState() ;
}

class _GeolocationState extends State<Geolocation> {


  String addresslocation;
  String postcode;
  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position position;
  void getMarkers(double lat, double long){
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat,long),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan
        ),
        infoWindow: InfoWindow(snippet: addresslocation)
    );
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentLocation() async{
    Position currentPosition = await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState(){
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Geolocation"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: GoogleMap(
                    onTap: (tapped) async {
                      final coordinated = new geoCo.Coordinates(tapped.latitude, tapped.longitude);
                      var address = await geoCo.Geocoder.local.findAddressesFromCoordinates(
                          coordinated);
                      var firstAddress = address.first;
                      getMarkers(tapped.latitude, tapped.longitude);
                      await Firestore.instance.collection('location').add({
                        'latitude': tapped.latitude,
                        'longitude': tapped.longitude,
                        'Address':firstAddress.addressLine,
                        'Post Code':firstAddress.postalCode
                      });
                      setState(() {
                        addresslocation = firstAddress.addressLine;
                        postcode = firstAddress.postalCode;
                      });
                    },
                    mapType: MapType.none,
                    compassEnabled: true,
                    trafficEnabled: true,
                    onMapCreated: (GoogleMapController controller){
                      setState(() {
                        googleMapController = controller;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 15.0
                    ),
                    markers: Set<Marker>.of(markers.values)),
              ),
              Text('Address: $addresslocation'),
              Text('PostalCode: $postcode'),
            ],
          ),
        )
    );
  }
}
