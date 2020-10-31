import 'package:fyp/service/authRoadGang.dart';
import 'package:flutter/material.dart';

class RoadGang extends StatefulWidget {
  @override
  _RoadGangState createState() => _RoadGangState();
}

class _RoadGangState extends State<RoadGang> {
  final AuthRoadGang _authRoadGang = new AuthRoadGang();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buruh Kakitangan'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
              child: Row(
                children: <Widget>[
                  Text("Keluar"),
                ],
              ),
              textColor: Colors.black87,
              onPressed: () async {
                await _authRoadGang.signOut();
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }
}