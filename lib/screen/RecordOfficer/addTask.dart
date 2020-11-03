import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/maps/google_maps.dart';

class AddTask extends StatefulWidget {

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  // text field state
  DateTime _dateTime = DateTime.now();
  int noAduan;
  String kerosakan = " ";
  String kategori;
  String sumberAduan;
  List <String> sumber = <String> ['Sistem Aduan MBPJ', 'Sistem Aduan Waze', 'Sistem Aduan Utiliti'];
  List <String> kate = <String> ['Segera', 'Pembaikan Biasa'];

  void _selectDate(BuildContext context) async{
    DateTime _datepicker = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1990),
      lastDate: DateTime(2040),
    );
    if (_datepicker != null && _datepicker != _dateTime){
         setState(() {
           _dateTime = _datepicker;
           print(_dateTime.toString());
         });
    }
  }

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
                validator: (value) => value.isEmpty ? 'Pastikan nombor Aduan dilengkapkan!': null,
                readOnly: true,
                onTap: (){
                  setState(() {
                    _selectDate(context);
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
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Lokasi',
                  prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMaps()));
                }
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

