
import 'package:fyp/model/RoadGang.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';

class UpdateRoadGang extends StatefulWidget {

  final RoadGang rg;

   UpdateRoadGang({Key key, this.rg}) : super(key: key);

  @override
  _UpdateRoadGangState createState() => _UpdateRoadGangState(rg);
}

class _UpdateRoadGangState extends State<UpdateRoadGang> {
  RoadGang rg;
  _UpdateRoadGangState(RoadGang rg){
    this.rg = rg;
  }
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name;
  TextEditingController _password;

  @override
  void initState(){
    super.initState();
    _name = TextEditingController(text:  widget.rg.username);
    _password = TextEditingController(text:  widget.rg.password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kemaskini Maklumat Kakitangan Buruh'),
          backgroundColor: Colors.blue[800],
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
                  controller: _password,

                ),
                const SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.blue[800],
                    textColor: Colors.white,
                    child: Text( "Kemaskini"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        DatabaseService().updateData1(RoadGang(username: _name.text, password: _password.text, uid: rg.uid)).then((value) async{
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

