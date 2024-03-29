import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';


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
                height: 400,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //full name
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Name Penuh',
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
                            decoration: InputDecoration(labelText: 'Kata Laluan Pengesahan',
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
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: RaisedButton(
                              child: Text('Daftar', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.white)),
                              onPressed: ()  async {
                                if(_formKey.currentState.validate()){
                                  setState(() => loading = true);
                                  dynamic result = await _auth.registerWithEmailandPassword(name, email, password, confrimpass, nophone);
                                  _buildErrorDialog1(context);
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
  Future _buildErrorDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tahniah!', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.green[900])),
          content: Text("Berjaya Daftar", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
          actions: [
            FlatButton(
                child: Text('Ok', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                })
          ],
        );
      },
    );
  }
}