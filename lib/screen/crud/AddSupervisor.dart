
import 'package:fyp/service/authSupervisor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AddSupervisor extends StatefulWidget {


  @override
  _AddSupervisorState createState() => _AddSupervisorState();
}

class _AddSupervisorState extends State<AddSupervisor> {

  //text field
  String name = ' ';
  String email = ' ';
  String uniqueID = ' ';
  String phone = ' ';
  String error;
  final AuthSupervisor _auth = AuthSupervisor();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("PENYELIA",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
            backgroundColor:  Colors.blue[800]
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NAMA",
                        hintText: 'NAMA',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NAMA DILENGKAPKAN!': null,
                    onChanged: (value) {
                      setState(() => name = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NOMBOR KAD PENGENALAN",
                        hintText: 'NOMBOR KAD PENGENALAN ',
                        prefixIcon: Icon(Icons.perm_contact_calendar),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR KAD PENGENALAN DILENGKAPKAN!': null,
                    onChanged: (value) {
                      setState(() => uniqueID = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "E-MEL",
                        hintText: 'E-MEL',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty ? 'PASTIKAN E-MEL DILENGKAPKAN!': null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "NOMBOR TELEFON",
                        hintText: 'NOMBOR TELEFON',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR TELEFON DILENGKAPKAN!': null,
                    onChanged: (value) {
                      setState(() => phone = value);
                    },
                  ),

                  const SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.blue[800],
                      textColor: Colors.white,
                      child: Text("SIMPAN"),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                            _auth.registerSupervisor(name.toUpperCase(), email, uniqueID, phone).then((value) async{
                            await alertDialog(context);
                            Navigator.pop(context);
                          });
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        );

    }
  Future<bool> alertDialog( BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('TAHNIAH'),
            content: Text('BERJAYA HANTAR'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

