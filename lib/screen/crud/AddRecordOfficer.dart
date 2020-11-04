import 'package:fyp/service/authRecordOfficer.dart';
import 'package:flutter/material.dart';




class AddRecordOfficer extends StatefulWidget {
  @override
  _AddRecordOfficerState createState() => _AddRecordOfficerState();
}

class _AddRecordOfficerState extends State<AddRecordOfficer> {

  //text field
  String name = ' ';
  String email = ' ';
  String icnumber = ' ';
  String phone = ' ';
  String zon = ' ';
  String pegawaiZon =' ';
  String selectZon;
  String selectPegawaiZon;
  List<String> noZon = <String> ['Zon 1', 'Zon 2', 'Zon 3', 'Zon 4', 'Zon 5', 'Zon 6', 'Zon 7', 'Zon 8'];
  List<String> namaPegawai = <String> ['Ahmad Fadzil', 'Ahmad Abu', 'Encik Hariz', 'Encik Ali', 'Encik Akif', 'Encik Daniel', 'Encik Sani', 'Encik Razak'];
  final AuthRecordOfficer _officer = new AuthRecordOfficer();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pegawai Merekod'),
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
                    hintText: 'No Kad Pengenalan ',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Pastikan Unik ID dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => icnumber = value);
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
              Text("Pilih Zon"),
              DropdownButtonFormField(
                    hint:Text('Zon'),
                    isExpanded: true,
                    value: selectZon,
                onChanged: (newValue) {
                  setState(() {
                    selectZon = newValue;
                    zon = selectZon;
                  });
                },
                items: noZon.map((zon){
                  return DropdownMenuItem(
                    value: zon,
                    child: new Text(zon),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              Text("Pilih Pegawai Zon"),
              DropdownButtonFormField(
                hint:Text('Pegawai Zon'),
                isExpanded: true,
                value: selectPegawaiZon,
                onChanged: (newValue) {
                  setState(() {
                    selectPegawaiZon = newValue;
                    pegawaiZon = selectPegawaiZon;
                  });
                },
                items: namaPegawai.map((pegawaiZon){
                  return DropdownMenuItem(
                    value: pegawaiZon,
                    child: new Text(pegawaiZon),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.black,
                  child: Text("Simpan"),
                  onPressed: () async {
                          if(_formKey.currentState.validate()){
                          _officer.registerRecordOfficer(name, email, icnumber, phone, zon, pegawaiZon).then((value) async{
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
