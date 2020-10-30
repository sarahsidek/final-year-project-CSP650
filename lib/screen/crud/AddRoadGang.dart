
import 'package:fyp/service/authRoadGang.dart';
import 'package:flutter/material.dart';


class AddRoadGang extends StatefulWidget {
  @override
  _AddRoadGangState createState() => _AddRoadGangState();
}


class _AddRoadGangState extends State<AddRoadGang> {
  //text field
  String name = ' ';
  String email = ' ';
  String uniqueID = ' ';
  String phone = ' ';
  final AuthRoadGang _authRoadGang = new AuthRoadGang();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kakitangan Buruh'),
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
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                validator: (value) => value.isEmpty ? 'Pastikan nama dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => name = value);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'E-mel',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value.isEmpty ? 'Pastikan e-mel dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Nombor Telefon',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Pastikan nombor telefon dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => phone = value);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Unik ID ',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Pastikan Unik ID dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => uniqueID = value);
                },
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.black,
                  child: Text("Hantar"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      _authRoadGang.registerRoadGang(name, email, uniqueID, phone).then((value) async{
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
            title: Text('Tahniah'),
            content: Text('Berjaya Hantar'),
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
