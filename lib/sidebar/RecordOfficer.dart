import 'package:flutter/material.dart';
import 'package:fyp/maps/geolocation.dart';

import 'package:fyp/maps/google_maps_address.dart';
import 'package:fyp/maps/maps.dart';
import 'package:fyp/screen/RecordOfficer/loginRecordOfficer.dart';
import 'package:fyp/service/authRecordOfficer.dart';



class RecordOfficerDrawer extends StatefulWidget {
  @override
  _RecordOfficerDrawerState createState() => _RecordOfficerDrawerState();
}

class _RecordOfficerDrawerState extends State<RecordOfficerDrawer> {

  final AuthRecordOfficer _officer = AuthRecordOfficer();
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            color: Colors.redAccent,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.add_location_alt),
            title: Text('Address1'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => Geolocation()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.add_location_alt),
            title: Text('Address2'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMaps()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.add_location_alt),
            title: Text('Address3'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout'),
              onTap: () async {
                await _officer.signOut();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => LoginRecordOfficer()));
              }
                  ),
        ],
      ),
    );
  }
}
