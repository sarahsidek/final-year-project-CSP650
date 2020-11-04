import 'package:fyp/model/NewUser.dart';

import 'package:fyp/service/database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class UpdateSupervisor extends StatefulWidget {

  final NewUser sv;

  UpdateSupervisor({Key key, this.sv}) : super(key: key);

  @override
  _UpdateSupervisorState createState() => _UpdateSupervisorState(sv);
}


class _UpdateSupervisorState extends State<UpdateSupervisor> {
  NewUser sv;
  _UpdateSupervisorState(NewUser sv){
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
            backgroundColor: Colors.redAccent,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 25.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    controller: _name,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'E-mel',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,

                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nombor Telefon',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    controller: _nophone,

                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'No kad Pengenalan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    controller: _icnumber,
                  ),
                  const SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.black,
                      child: Text( "Kemaskini"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          DatabaseService().updateData(NewUser(name: _name.text, email: _email.text, nophone: _nophone.text,
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

