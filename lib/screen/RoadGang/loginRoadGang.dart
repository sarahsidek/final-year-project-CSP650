import 'package:fyp/screen/RoadGang/pageRoadGang.dart';
import 'package:fyp/service/authRoadGang.dart';
import 'package:flutter/material.dart';

class LoginRoadGang extends StatefulWidget {
  @override
  _LoginRoadGangState createState() => _LoginRoadGangState();
}

class _LoginRoadGangState extends State<LoginRoadGang> {
  // text field state
  String email = '', uniqueID = '', error = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loading = false;
  final AuthRoadGang _auth = AuthRoadGang();

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
                              decoration: InputDecoration(labelText: 'Email',
                                  prefixIcon: Icon(Icons.person)),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value)
                              {
                                if(value.isEmpty || !value.contains('@'))
                                {
                                  return 'invalid email';
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
                            decoration: InputDecoration(labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key)),
                            obscureText: true,
                            validator: (value) => value.isEmpty ? 'Password cannot be null': null,
                            onChanged: (value)
                            {
                              setState(() => uniqueID = value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: <Widget>[
                              RaisedButton(
                                child: Text(
                                    'Login'
                                ),
                                onPressed: () async {
                                  if( _formKey.currentState.validate()){
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInRoadGang(email, uniqueID);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RoadGang()));
                                    if (result == null){
                                      setState(() {
                                        error = 'Please supply a valid email';
                                        loading = false;
                                      });
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

}
