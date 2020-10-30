
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {


  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final GlobalKey<FormState> _formKey = GlobalKey();
    FirebaseUser admin;
  Future<void>getData() async {
     FirebaseUser uid = await FirebaseAuth.instance.currentUser();
     setState(() {
       admin = uid;
     });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body:Container(
          child: Column(
            children: <Widget>[
              Text("Welcome to admin"),
            Text("Your email is ${admin.email}"),
              Text("Name is ${admin.uid}"),
            ],
          ),
      )
    );

  }
}
