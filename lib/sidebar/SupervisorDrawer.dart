import 'package:flutter/material.dart';
import 'package:fyp/maps/display_geolocation.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTask.dart';
import 'package:fyp/screen/supervisor/ListOfTaskApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTaskNotApprove.dart';
import 'package:fyp/service/authSupervisor.dart';


class SupervisorDrawer extends StatefulWidget {
  @override
  _SupervisorDrawerState createState() => _SupervisorDrawerState();
}


class _SupervisorDrawerState extends State<SupervisorDrawer> {
  final AuthSupervisor _authSupervisor = AuthSupervisor();
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
            title: Text('Lokasi Pegawai Merekod'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayGeolocation()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Senarai Aduan Yang Telah Di Sah '),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskApprove()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Senarai Aduan Yang Telah Di Tidak Sah '),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotApprove()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Senarai Aduan daripada Road Gang '),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTask()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout'),
              onTap: () async {
                await _authSupervisor.signOut();
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

