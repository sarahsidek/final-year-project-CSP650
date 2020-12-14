import 'package:fyp/screen/RoadGang/listTaskFromSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/authRoadGang.dart';

class RoadGangHome extends StatefulWidget {
  @override
  _RoadGangHomeState createState() => _RoadGangHomeState();
}

class _RoadGangHomeState extends State<RoadGangHome> {
  final AuthRoadGang _authRoadGang = new AuthRoadGang();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buruh Kakitangan'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    child: Column(
                      children: [
                        new Text("Senarai Tugasan"),
                        new Text("(Diterima Telah"),
                        new Text("Diluluskan)"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListTaskFromSupervisor()))
                    },
                    splashColor: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    child:new Text("Keluar"),
                    onPressed: () => {
                     _authRoadGang.signOut(),
                      Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()))
                    },
                    splashColor: Colors.redAccent,
                  ),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}