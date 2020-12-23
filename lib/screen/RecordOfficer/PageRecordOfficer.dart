
import 'package:fyp/screen/RecordOfficer/ListOfTaskAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskNotAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:fyp/screen/RecordOfficer/addTask.dart';

import 'package:flutter/material.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/authRecordOfficer.dart';

class RecordOfficer extends StatefulWidget {


  @override
  _RecordOfficerState createState() => _RecordOfficerState();
}

class _RecordOfficerState extends State<RecordOfficer> {
  final AuthRecordOfficer _officer = AuthRecordOfficer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pegawai Merekod '),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed:() async{
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => AddTask()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed:() async{
                    await _officer.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  }),
            ],
          )
        ],
      ),
      body: GridView.count(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskAccepted()));
                  },
                ),
                Center(child: Text("Senarai Tugasan (Diterima)"))
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotAccepted()));
                  },
                ),
                Center(child: Text("Senarai Tugasan (Ditolak)"))
              ],
            ),
          ),
        ],
      )
    );
  }
}