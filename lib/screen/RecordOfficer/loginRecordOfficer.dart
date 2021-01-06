import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/screen/RecordOfficer/PageRecordOfficer.dart';
import 'package:fyp/service/authRecordOfficer.dart';
import 'package:flutter/material.dart';

class LoginRecordOfficer extends StatefulWidget {
  @override
  _LoginRecordOfficerState createState() => _LoginRecordOfficerState();
}

class _LoginRecordOfficerState extends State<LoginRecordOfficer> {
  // text field state
  String email = '', icnumber = '', error = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loading = false;
  final AuthRecordOfficer _officer = new AuthRecordOfficer();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.blue[800],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[800],
            ),
          ),
          Image.asset('assets/mpbj2.png', height: 150, width: 450),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                height: 240,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //email
                          TextFormField(
                              decoration: InputDecoration(labelText: 'Pegawai Merekod: E-mel ',
                                  prefixIcon: Icon(Icons.person)),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value)
                              {
                                if(value.isEmpty || !value.contains('@'))
                                {
                                  return 'Pastikan e-mel anda sah!';
                                }
                                return null;
                              },
                              onChanged: (value)
                              {
                                setState(() => email = value);
                              }
                          ),
                          //password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Kata Laluan',
                                prefixIcon: Icon(Icons.vpn_key)),
                            obscureText: true,
                            validator: (value) => value.isEmpty ? 'Kata Laluan tidak sah!': null,
                            onChanged: (value)
                            {
                              setState(() => icnumber = value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: <Widget>[
                              RaisedButton(
                                child: Text(
                                    'Log Masuk'
                                ),
                                onPressed: () async {
                                  if( _formKey.currentState.validate()) {
                                    try {
                                      setState(() => loading = true);
                                      dynamic result = await _officer
                                          .signInRecordOfficer(email, icnumber);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              RecordOfficer()));
                                      if (result == null) {
                                        setState(() {
                                          error = 'Pastikan e-mel anda sah!';
                                          loading = false;
                                        });
                                      }
                                    } on AuthException catch (error){
                                      return _buildErrorDialog(context, error.message);
                                    } on Exception catch (error) {
                                      return _buildErrorDialog(context, error.toString());
                                    }
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.blue[700],
                                textColor: Colors.white,
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future _buildErrorDialog(BuildContext context, message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(message),
          actions: [
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}

