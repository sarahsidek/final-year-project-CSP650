import 'package:fyp/model/NewUser.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';

class UpdateRoadGang extends StatefulWidget {

  final NewUser rg;

   UpdateRoadGang({Key key, this.rg}) : super(key: key);

  @override
  _UpdateRoadGangState createState() => _UpdateRoadGangState(rg);
}

class _UpdateRoadGangState extends State<UpdateRoadGang> {
  NewUser rg;
  _UpdateRoadGangState(NewUser rg){
    this.rg = rg;
  }
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _nophone;
  TextEditingController _icnumber;


  @override
  void initState(){
    super.initState();
    _name = TextEditingController(text:  widget.rg.name);
    _email = TextEditingController(text:  widget.rg.email);
    _nophone = TextEditingController(text: widget.rg.nophone);
    _icnumber= TextEditingController(text: widget.rg.icnumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kemaskini Maklumat Kakitangan Buruh'),
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
                        DatabaseService().updateData1(NewUser(name: _name.text, email: _email.text,
                            nophone: _nophone.text, icnumber: _icnumber.text, uid: rg.uid)).then((value) async{
                          await alertDialog(
                              context);
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

