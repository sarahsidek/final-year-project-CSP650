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
      floatingActionButton:   FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:
                (context) => AddTask()));
          }
      ),
      appBar: AppBar(
        title: Text('Pegawai Merekod '),
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
                    child: new Text("Senarai Tugasan"),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()))
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
                    child: Column(
                      children: [
                        new Text("Senarai Tugasan"),
                        new Text("(Diterima)"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskAccepted()))
                    },
                    splashColor: Colors.redAccent,
                  ),
                )
              ],
            ),
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
                        new Text("(Yang Ditolak)"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotAccepted()))
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
                    child: new Text("Keluar"),
                    onPressed: () => {
                      _officer.signOut(),
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