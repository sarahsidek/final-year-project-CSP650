import 'package:flutter/material.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/authSupervisor.dart';


class SupervisorDrawer extends StatefulWidget {
  @override
  _SupervisorDrawerState createState() => _SupervisorDrawerState();
}

final AuthSupervisor _authSupervisor = AuthSupervisor();
class _SupervisorDrawerState extends State<SupervisorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            color: Colors.redAccent,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout'),
              onTap: () async {
                await _authSupervisor.signOut();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              }
          ),
        ],
      ),
    );
  }
}

