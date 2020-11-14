import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/supervisor/List_of_taskPenyelia.dart';
import 'package:fyp/sidebar/SupervisorDrawer.dart';


class Supervisor extends StatefulWidget {


  @override
  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyelia'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      drawer: SupervisorDrawer(),
      body: List_ofTask(),
    );
  }
}
