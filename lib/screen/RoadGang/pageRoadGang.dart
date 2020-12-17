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
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed:() async{
                await _authRoadGang.signOut();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              })
        ],
      ),
      body: ListTaskFromSupervisor()
      );
  }
}