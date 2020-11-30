import 'package:flutter/material.dart';
import 'package:fyp/maps/google_maps_address.dart';
import 'package:fyp/screen/RoadGang/listTaskFromSupervisor.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/authRoadGang.dart';


class RoadGangDrawer extends StatefulWidget {
  @override
  _RoadGangDrawerState createState() => _RoadGangDrawerState();
}

class _RoadGangDrawerState extends State<RoadGangDrawer> {
  @override
  Widget build(BuildContext context) {
    final AuthRoadGang _authRoadGang = new AuthRoadGang();
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
              leading: Icon(Icons.home),
              title: Text('Senarai Tugasan '),
              onTap: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListTaskFromSupervisor()));
              },
            ),
            SizedBox(height: 5.0),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Alamat'),
              onTap: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMaps()));
              },
            ),
            SizedBox(height: 5.0),
            ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Logout'),
                onTap: () async {
                  await _authRoadGang.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                }
            ),
          ],
        ),
      );
    }
  }
