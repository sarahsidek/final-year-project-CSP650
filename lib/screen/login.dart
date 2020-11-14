import 'package:fyp/screen/RecordOfficer/loginRecordOfficer.dart';
import 'package:fyp/screen/supervisor/loginSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/signup.dart';
import 'package:fyp/service/auth.dart';
import 'package:fyp/screen/homepage.dart';



class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  // text field state
  String email = '', password = '', error = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Colors.redAccent
                  ]
              )
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Penyelia'),
              ],
            ),
            textColor: Colors.black87,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSupervisor()));
            },
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Pegawai Merekod'),
              ],
            ),
            textColor: Colors.black87,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRecordOfficer()));
            },
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Buruh '),
              ],
            ),
            textColor: Colors.black87,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRecordOfficer()));
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.redAccent
                    ]
                )
            ),
          ),
          Image.asset('assets/mpbj2.png', height: 150, width: 450),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                height: 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //email
                          TextFormField(
                              decoration: InputDecoration(labelText: 'E-mel',
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
                              if(value.isEmpty || value.length<=5)
                              {
                                return 'Kata Laluan tidak sah!';
                              }
                              return null;
                            },
                            onChanged: (value)
                            {
                              setState(() => password = value);
                            },
                          ),
                          Column(
                            children: <Widget>[
                              RaisedButton(
                                child: Text(
                                    'Log Masuk'
                                ),
                                onPressed: () async {
                                  if( _formKey.currentState.validate()){
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                    if (result == null){
                                      setState(() {
                                        error = 'Pastikan e-mel anda sah!';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                              ),
                              RaisedButton(
                                child: Text(
                                    'Daftar'
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.blue,
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
}