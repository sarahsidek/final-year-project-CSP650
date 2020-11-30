import 'package:flutter/material.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskNotAccepted.dart';
import 'package:fyp/screen/login.dart';
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
            leading: Icon(Icons.home_filled),
            title: Text('Aduan Diterima'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskAccepted()));
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Aduan Tidak Diterima'),
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotAccepted()));
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
                        builder: (context) => LoginScreen()));
              }
                  ),
        ],
      ),
    );
  }
}
