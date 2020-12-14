import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      ),
      body:Center(
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
                        new Text("(Pegawai Merekod)"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => List_ofTask()))
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
                        new Text("Tidak Diluluskan"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotApprove()))
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
                        new Text("Lengkap"),
                        new Text("(RoadGang)")
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTask()))
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
                        new Text("Lengkap"),
                        new Text("Tidak Diluluskan"),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTaskNotApprove()))
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
                        new Text("Keluar"),
                      ],
                    ),
                    onPressed: () => {
                     _authSupervisor.signOut(),
                      Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()))
                    },
                    splashColor: Colors.redAccent,
                  ),
                ),

              ],
            )
          ],
        ),
      )
    );
  }
}
