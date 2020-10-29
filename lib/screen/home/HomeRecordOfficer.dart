
import 'package:fyp/screen/crud/listRecordOfficer.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/crud/AddRecordOfficer.dart';

class HomeRecordOfficer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Record Officer'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecordOfficer()));
              })
        ],
      ),
      body: ListRecordOfficer(),
    );
  }
}


