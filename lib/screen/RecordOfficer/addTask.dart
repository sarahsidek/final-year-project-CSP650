
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/RecordOfficer.dart';
import 'package:fyp/service/database.dart';


class AddTask extends StatefulWidget {

  final RecordOfficer rd;

  const AddTask({Key key, this.rd}) : super(key: key);
  @override
  _AddTaskState createState() => _AddTaskState(rd);
}

class _AddTaskState extends State<AddTask> {
    RecordOfficer rd;
    _AddTaskState(RecordOfficer result){
      this.rd = rd;
    }
  // text field state
  DateTime _dateTime = DateTime.now();
  String noAduan;
  String kerosakan = " ";
  String kategori;
  String sumberAduan;
  List <String> sumber = <String> ['Sistem Aduan MBPJ', 'Sistem Aduan Waze', 'Sistem Aduan Utiliti'];
  List <String> kate = <String> ['Segera', 'Pembaikan Biasa'];


    RecordOfficer _user;
    RecordOfficer get currentRecordOfficer => _user;

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borang Aduan'),
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
                    labelText: "Pilih Tarikh",
                   prefixIcon: Icon(Icons.calendar_today),
                    hintText: _dateTime.toString(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                readOnly: true,
                onChanged: (value){
                  setState(() {
                    _dateTime = value as DateTime;
                    print(_dateTime);
                  });
                },
              ),
              SizedBox(height: 10.0),
              DropdownButton(
                hint: Text("Sumber Aduan"),
                isExpanded: true,
                value:sumberAduan,
                onChanged: (value) {
                    setState(() {
                    sumberAduan = value;
                    });
                    },
                items: sumber.map((value){
                  return DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Nombor Aduan ',
                    prefixIcon: Icon(Icons.confirmation_number_sharp),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Pastikan nombor Aduan dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => noAduan = value );
                },
              ),
              SizedBox(height: 10.0),
              DropdownButton(
                    hint: Text('Kategori'),
                   isExpanded: true,
                value: kategori,
                onChanged: (value) {
                      setState(() {
                        kategori = value;
                      });
                },
                items: kate.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.black,
                  child: Text("Hantar"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      DatabaseService().addNewTask(_dateTime, sumberAduan, noAduan, kategori).then((value) async{
                        await alertDialog(
                            context);
                        Navigator.pop(context);
                      });
                      print("Successful");
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

