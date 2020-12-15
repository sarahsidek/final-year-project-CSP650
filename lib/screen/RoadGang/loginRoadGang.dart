import 'package:fyp/screen/RoadGang/pageRoadGang.dart';
import 'package:fyp/service/authRoadGang.dart';
import 'package:flutter/material.dart';

class LoginRoadGang extends StatefulWidget {
  @override
  _LoginRoadGangState createState() => _LoginRoadGangState();
}

class _LoginRoadGangState extends State<LoginRoadGang> {
  // text field state
  String name = '', password = '', error = '';
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
                              decoration: InputDecoration(labelText: 'Buruh: Nama Pengguna',
                                  prefixIcon: Icon(Icons.person)),
                              keyboardType: TextInputType.text,
                              validator: (value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'Pastikan nama pengguna anda sah!';
                                }
                                return null;
                              },
                              onChanged: (value)
                              {
                                setState(() => name = value);
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
                              setState(() => password = value);
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
                                  if( _formKey.currentState.validate()){
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInRoadGang(name, password);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RoadGangHome()));
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
