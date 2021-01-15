import 'package:fyp/service/authRoadGang.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AddRoadGang extends StatefulWidget {
  @override
  _AddRoadGangState createState() => _AddRoadGangState();
}


class _AddRoadGangState extends State<AddRoadGang> {
  //text field
  String name = ' ';
  String password = ' ';
  final AuthRoadGang _authRoadGang = new AuthRoadGang();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buruh Kakitangan",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor:  Colors.blue[800],
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
                  labelText: "E-mel",
                    hintText: 'E-mel',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                validator: (value) => value.isEmpty ? 'Pastikan e-mel dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => name = value);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Kata Laluan",
                    hintText: 'Kata Laluan',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => value.isEmpty ? 'Pastikan kata laluan dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blue[800],
                  textColor: Colors.white,
                  child: Text("Simpan"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      _authRoadGang.registerRoadGang(name, password).then((value) async{
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
