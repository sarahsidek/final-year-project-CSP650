
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:fyp/screen/RecordOfficer/addTask.dart';

import 'package:flutter/material.dart';
import 'package:fyp/sidebar/RecordOfficer.dart';

class RecordOfficer extends StatefulWidget {


  @override
  _RecordOfficerState createState() => _RecordOfficerState();
}
class _RecordOfficerState extends State<RecordOfficer> {




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
      ),
      drawer: RecordOfficerDrawer(),
      body: ListTask(),
    );
  }
}