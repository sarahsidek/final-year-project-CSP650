import 'package:fyp/screen/RecordOfficer/PageRecordOfficer.dart';
import 'package:fyp/service/authRecordOfficer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRecordOfficer extends StatefulWidget {
  @override
  _LoginRecordOfficerState createState() => _LoginRecordOfficerState();
}

class _LoginRecordOfficerState extends State<LoginRecordOfficer> {
  // text field state
  String email = '', icnumber = '', error = '', showError = ' ';
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
                                  return 'Pastikan email dilengkapkan!';
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
                            validator: (value) => value.isEmpty ? 'Pastikan kata laluan dilengkapkan!': null,
                            onChanged: (value)
                            {
                              setState(() => icnumber = value);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: RaisedButton(
                                  child: Text('Log Masuk', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.white)),
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
                                  color: Colors.blue[700],
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
      context: context,
    );
  }
}

