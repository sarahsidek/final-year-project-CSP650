
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/service/database.dart';

class UpdateProfile extends StatefulWidget {

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final GlobalKey<FormState> _formKey = GlobalKey();
    FirebaseUser admin;
  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _nophone;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Kemaskini Maklumat Penyelia'),
            backgroundColor: Colors.redAccent,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 25.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    controller: _name,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'E-mel',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,

                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nombor Telefon',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    controller: _nophone,

                  ),
                  RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.black,
                      child: Text( "Kemaskini"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                            DatabaseService().updateProfile(_name.text, _email.text, _nophone.text);
                        }
                      }
                  )
                ],
              ),
            ),
          )
      );
    }
    Future<bool> alertDialog( BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tahniah'),
              content: Text('Berjaya Kemaskini'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }

