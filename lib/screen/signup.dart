import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/service/auth.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();

}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loading = false;
  //text field state
  String email = '', password = '',  name = '', nophone = '', confrimpass = '', error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.blue[800]
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[800]
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                height: 360,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //full name
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Name penuh',
                                prefixIcon: Icon(Icons.person)),
                            keyboardType: TextInputType.text,
                            validator: (value) => value.isEmpty ? 'Pastikan nama penuh dilengkapkan!': null,
                            onChanged: (value)
                            {
                              setState(() => name = value);
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Nombor Telefon',
                                prefixIcon: Icon(Icons.call)),
                            keyboardType: TextInputType.number,
                            validator: (value) => value.isEmpty ? 'Pastikan nombor telefon dilengkapkan!': null,
                            onChanged: (value)
                            {
                              setState(() => nophone = value);
                            },
                          ),

                          //email
                          TextFormField(
                            decoration: InputDecoration(labelText: 'E-mel',
                                prefixIcon: Icon(Icons.email)),
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
                            },
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
                          //confirmation password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'kata laluan pengesahan',
                                prefixIcon: Icon(Icons.vpn_key)),
                            obscureText: true,
                            validator: (value) => value.isEmpty ? 'Pastikan kata laluan pengesahan dilengkapkan!' : null,
                            onChanged: (value)
                            {
                              setState(() => confrimpass = value);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RaisedButton(
                            child: Text(
                                'Daftar'
                            ),
                            onPressed: ()  async {
                              if(_formKey.currentState.validate()){
                                setState(() => loading = true);
                                dynamic result = await _auth.registerWithEmailandPassword(name, email, password, confrimpass, nophone);
                                Navigator.pop(context);
                                if(result == null){
                                  setState(() {
                                    error = 'Log masuk tidak sah!';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue[800],
                            textColor: Colors.white,
                          ),
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