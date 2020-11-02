
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final GlobalKey<FormState> _formKey = GlobalKey();
    FirebaseUser admin;
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Admin').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          if(!snapshot.hasData) {
            return Text('Loading data... Please wait..');
          }
           return Column(
             children: <Widget>[
               Text(snapshot.data.documents[0]['email']),
               Text(snapshot.data.documents[0]['nophone']),
             ],
           );
          }
      )
    );

  }
}
