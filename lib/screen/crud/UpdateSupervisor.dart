import 'package:fyp/model/Supervisor.dart';

import 'package:fyp/service/database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





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
            title: Text('Kemaskini Maklumat Penyelia'),
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
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    validator: (value) => value.isEmpty ? 'Pastikan nama dilengkapkan!': null,
                    controller: _name,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "No kad Pengenalan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'Pastikan Kad Pengenalan dilengkapkan!': null,
                    controller: _icnumber,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "E-mel",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty ? 'Pastikan e-mel dilengkapkan!': null,
                    controller: _email,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Nombor Telefon",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'Pastikan nombor telefon dilengkapkan!': null,
                    controller: _nophone,
                  ),
                  const SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.blue[800],
                      textColor: Colors.white,
                      child: Text( "Kemaskini"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          DatabaseService().updateData(Supervisor(name: _name.text, email: _email.text, nophone: _nophone.text,
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
            title: Text('Tahniah'),
            content: Text('Berjaya Kemaskini'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

