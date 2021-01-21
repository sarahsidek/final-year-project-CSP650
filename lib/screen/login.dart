import 'package:fyp/screen/searchTask.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/signup.dart';
import 'package:fyp/service/auth.dart';
import 'package:fyp/screen/homepage.dart';
import 'package:google_fonts/google_fonts.dart';




class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  // text field state
  String email = '', password = '', error = '', showError = ' ';
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
              color: Colors.blue[800]
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black87,
              ),
              onPressed:() async{
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => SearchTask()));
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[800]
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
                                  return "Pastikan email dilengkapkan!";
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
                                return 'Pastikan kata laluan dilengkapkan!';
                              }
                              return null;
                            },
                            onChanged: (value)
                            {
                              setState(() => password = value);
                            },
                          ),
                          SizedBox(height: 10,),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: RaisedButton(
                                  child: Text("Log Masuk", style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.white)),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      try {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                            email, password);
                                        _buildErrorDialog1(context);
                                        if (result == null) {
                                          setState(() {
                                            error = 'Pastikan e-mel anda sah!';
                                            loading = false;
                                          });
                                        }
                                      } catch (e){
                                        setState(() {
                                          showError = "Kata laluan tidak sah atau pengguna tidak mempunyai kata laluan";
                                        });
                                        return _buildErrorDialog(context,showError);
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
                              SizedBox(height: 10,),
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: RaisedButton(
                                  child: Text('Daftar', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.white)),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
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
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Harap Maaf', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.red)),
          content: Text("$message", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
          actions: [
            FlatButton(
                child: Text('Batal', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
  Future _buildErrorDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tahniah!', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.green[900])),
          content: Text("Anda Berjaya Masuk!", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
          actions: [
            FlatButton(
                child: Text('Ok', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                })
          ],
        );
      },
    );
  }
}
