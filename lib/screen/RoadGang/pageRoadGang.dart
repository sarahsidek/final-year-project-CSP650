import 'package:fyp/screen/RoadGang/listTaskFromSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/sidebar/RoadGang.dart';

class RoadGangHome extends StatefulWidget {
  @override
  _RoadGangHomeState createState() => _RoadGangHomeState();
}

class _RoadGangHomeState extends State<RoadGangHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buruh Kakitangan'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      drawer: RoadGangDrawer(),
      body: ListTaskFromSupervisor(),
    );
  }
}