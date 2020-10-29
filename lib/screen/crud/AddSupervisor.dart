import 'package:fyp/service/authSupervisor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





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
            title: Text('Supervisor'),
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
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.text,
                    validator: (value) => value.isEmpty ? 'Name cannot be empty!': null,
                    onChanged: (value) {
                      setState(() => name = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty ? 'Email cannot be empty!': null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Number Phone',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'Number Phone cannot be empty!': null,
                    onChanged: (value) {
                      setState(() => phone = value);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Unique ID ',
                        prefixIcon: Icon(Icons.perm_contact_calendar),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    validator: (value) => value.isEmpty ? 'Ic number cannot be empty!': null,
                    onChanged: (value) {
                          setState(() => uniqueID = value);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.black,
                      child: Text("Save"),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                            _auth.registerSupervisor(name, email, uniqueID, phone).then((value) async{
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
            title: Text('Done'),
            content: Text('Add Success'),
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

