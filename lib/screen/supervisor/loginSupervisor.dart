import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/screen/supervisor/PageSupervisor.dart';
import 'package:fyp/service/authSupervisor.dart';

import 'package:flutter/material.dart';




class LoginSupervisor extends StatefulWidget {
  @override
  _LoginSupervisorState createState() => _LoginSupervisorState();
}

class _LoginSupervisorState extends State<LoginSupervisor> {

  // text field state
  String email = '', icnumber = '', error = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loading = false;
  final AuthSupervisor _auth = AuthSupervisor();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.redAccent,
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
                              decoration: InputDecoration(labelText: 'Penyelia: E-mel',
                                  prefixIcon: Icon(Icons.person)),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value)
                              {
                                if(value.isEmpty || !value.contains('@'))
                                {
                                  return 'E-mel tidak sah!';
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
                            validator: (value)
                            {
                              if(value.isEmpty || value.length<=6)
                              {
                                return 'Kata Laluan tidak sah!';
                              }
                              return null;
                            },
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
                                      dynamic result = await _auth
                                          .signInSupervisor(email, icnumber);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Supervisor()));
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
                                color: Colors.redAccent,
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
