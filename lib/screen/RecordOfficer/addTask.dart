import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RecordOfficer/addtask1.dart';





class AddTask extends StatefulWidget {


  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  // text field state
  DateTime _dateTime = DateTime.now();
  String noAduan;
  String kerosakan = " ";
  String kategori;
  String sumberAduan;
  String imageUrl;
  List <String> sumber = <String> ['Sistem Aduan MBPJ', 'Sistem Aduan Waze', 'Sistem Aduan Utiliti'];
  List <String> kate = <String> ['Segera', 'Pembaikan Biasa'];


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
                  child: Text("Seterusnya"),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask1(
                        _dateTime,sumberAduan, kategori, noAduan)));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}