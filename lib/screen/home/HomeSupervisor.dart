import 'package:fyp/screen/crud/listSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/crud/AddSupervisor.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/auth.dart';




class HomeSupervisor extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[800],
        title: Text('Penyelia'),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddSupervisor()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed:() async{
                    await _authService.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  }),
            ],
          )
        ],
      ),
      body: ListSupervisor(),
    );
  }

}








