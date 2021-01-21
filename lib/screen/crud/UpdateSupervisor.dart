import 'package:fyp/model/Supervisor.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepage.dart';





class UpdateSupervisor extends StatefulWidget {

  final Supervisor sv;

  UpdateSupervisor({Key key, this.sv}) : super(key: key);

  @override
  _UpdateSupervisorState createState() => _UpdateSupervisorState(sv);
}


class _UpdateSupervisorState extends State<UpdateSupervisor> {
  Supervisor sv;
  _UpdateSupervisorState(Supervisor sv){
    this.sv = sv;
  }
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _nophone;
  TextEditingController _icnumber;



@override
void initState(){
     super.initState();
     _name = TextEditingController(text:  widget.sv.name);
     _email = TextEditingController(text:  widget.sv.email);
     _nophone = TextEditingController(text: widget.sv.nophone);
     _icnumber= TextEditingController(text: widget.sv.icnumber);

}
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('KEMASKINI MAKLUMAT PENYELIA',style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 16)),
            backgroundColor: Colors.blue[800],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NAMA",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NAMA DILENGKAPKAN!': null,
                    controller: _name,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NOMBOR KAD PENGENALAN",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR KAD PENGENALAN DILENGKAPKAN!': null,
                    controller: _icnumber,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "E-MEL",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty ? 'PASTIKAN E-MEL DILENGKAPKAN!': null,
                    controller: _email,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NOMBOR TELEFON",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR TELEFON DILENGKAPKAN!': null,
                    controller: _nophone,
                  ),
                  const SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.blue[800],
                      textColor: Colors.white,
                      child: Text( "KEMASKINI"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          DatabaseService().updateData(Supervisor(name: _name.text.toUpperCase(), email: _email.text, nophone: _nophone.text,
                              icnumber: _icnumber.text, uid: sv.uid)).then((value) async{
                                print(sv.uid);
                                await alertDialog(context);
                                Navigator.pop(context);
                          });
                        }
                      }
                  ),
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
            title: Text('TAHNIAH', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.green[900])),
            content: Text('BERJAYA KEMASKINI', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Home()));
                },
              ),
            ],
          );
        });
  }
}

