
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
      body:StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('Admin').document(admin.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot>snapshot) {
          if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}' );
          }
            return Text(snapshot.data['name']);
          }
      )
    );

  }
}
