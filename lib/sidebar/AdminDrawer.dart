import 'package:fyp/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:fyp/service/auth.dart';




class AdminDrawer extends StatefulWidget {


  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {

  final AuthService _authService = AuthService();

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
                    await _authService.signOut();
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
