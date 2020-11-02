import 'package:fyp/screen/crud/listSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/crud/AddSupervisor.dart';
import 'package:fyp/sidebar/AdminDrawer.dart';



class HomeSupervisor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Penyelia'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddSupervisor()));
              })
        ],
      ),
      drawer: AdminDrawer(),
      body: ListSupervisor(),
    );
  }

}








