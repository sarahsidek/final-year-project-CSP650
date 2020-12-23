import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/maps/display_geolocation.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTask.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTaskNotApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTaskNotApprove.dart';
import 'package:fyp/screen/supervisor/List_of_taskPenyelia.dart';
import 'package:fyp/service/authSupervisor.dart';


class Supervisor extends StatefulWidget {


  @override
  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  final AuthSupervisor _authSupervisor = AuthSupervisor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyelia'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed:() async{
                await _authSupervisor.signOut();
                Navigator.push(context,
                MaterialPageRoute(
                builder: (context) => LoginScreen()));
              })
        ],
      ),
      body:GridView.count(
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        primary: false,
        crossAxisCount: 2,
        children: [
          Card(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.folder),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTask()));
                  },
                ),
                Center(child: Text("Senarai Tugasan"))
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.folder),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotApprove()));
                  },
                ),
                Center(child: Text("Senarai Tugasan (Ditolak)"))
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.folder),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTask()));
                  },
                ),
                Center(child: Text("Senarai Tugasan Lengkap"))
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.folder),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTaskNotApprove()));
                  },
                ),
                Center(child: Text("Senarai Tugasan Lengkap (Ditolak)"))
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.location_history),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayGeolocation()));
                  },
                ),
                Center(child: Text("Lokasi Tugasan Road Gang"))
              ],
            ),
          ),
        ],
      )
    );
  }
}
