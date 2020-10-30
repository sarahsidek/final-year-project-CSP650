import 'package:fyp/service/authSupervisor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Supervisor extends StatefulWidget {


  @override
  _SupervisorState createState() => _SupervisorState();
}

final AuthSupervisor _supervisor = new AuthSupervisor();
class _SupervisorState extends State<Supervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyelia'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text("Keluar"),
              ],
            ),
              textColor: Colors.black87,
              onPressed: () async {
               await _supervisor.signOut();
               Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }
}
