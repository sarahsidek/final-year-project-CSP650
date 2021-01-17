import 'package:fyp/model/RecordOfficer.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';

class UpdateRecordOfficer extends StatefulWidget {

  final RecordOfficer rd;

  UpdateRecordOfficer({Key key, this.rd}) : super(key: key);


  @override
  _UpdateRecordOfficerState createState() => _UpdateRecordOfficerState(rd);

}

class _UpdateRecordOfficerState extends State<UpdateRecordOfficer> {
  RecordOfficer rd;
  _UpdateRecordOfficerState(RecordOfficer rd){
    this.rd = rd;
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _nophone;
  TextEditingController _icnumber;
  TextEditingController _zon;
  TextEditingController _pegawaiZon;


  @override
  void initState(){
    super.initState();
    _name = TextEditingController(text:  widget.rd.name);
    _email = TextEditingController(text:  widget.rd.email);
    _nophone = TextEditingController(text: widget.rd.nophone);
    _icnumber= TextEditingController(text: widget.rd.icnumber);
    _zon = TextEditingController(text: widget.rd.zon);
    _pegawaiZon = TextEditingController(text: widget.rd.pegawaiZon);
  }
  String selectZon;
  String selectPegawaiZon;
  List<String> noZon = <String> ['ZON 1', 'ZON 2', 'ZON 3',
                                  'ZON 4', 'ZON 5', 'ZON 6',
                                  'ZON 7', 'ZON 8', 'ZON 9',
                                  'ZON 10', 'ZON 11', 'ZON 12',
                                  'ZON 13', 'ZON 14', 'ZON 15',
                                  'ZON 16', 'ZON 17', 'ZON 18',
                                  'ZON 19', 'ZON 20', 'ZON 21',
                                  'ZON 22', 'ZON 23', 'ZON 24'];
  List<DropdownMenuItem<String>> _naPeg = List();
  bool disableDrop = true;
  final zon1 = {
    "1": "JEFRI IZMIL BIN ABDUL SAMAT",
    "2": "MOHAMAD RATNO KARNO BIN KASRO"
  };

  final zon2 = {
    "1": "NURUL AZREEN BINTI ROSNI"
  };

  final zon3 = {
    "1": "MOHAMAD RATNO KARNO BIN KASRO"
  };

  final zon4 = {
    "1": "MUHAMMAD IZZHAR BIN KHAIRUDIN",
    "2": "AMINUL RASYID BIN HUSIN"
  };

  final zon5 = {
    "1": "MUHAMAD NIKMAN BIN HAMDAN"
  };

  final zon6 = {
    "1": "MUHAMAD NIKMAN BIN HAMDAN"
  };

  final zon7 = {
    "1": "MUHAMMAD IZZHAR BIN KHAIRUDIN"
  };

  final zon8 = {
    "1": "NURUL HIDAYU BINTI SAHRONI"
  };

  final zon9 = {
    "1": "NURUL HIDAYU BINTI SAHRONI"
  };

  final zon10 = {
    "1": "AQILAH BINTI ALIAS"
  };

  final zon11 = {
    "1": "AQILAH BINTI ALIAS"
  };

  final zon12 = {
    "1": "SHAIPU AL BAHRI BIN MOHAMAD"
  };
  final zon13 = {
    "1": "SHAIPU AL BAHRI BIN MOHAMAD"
  };
  final zon14 = {
    "1": "MUHAMAD AZAD BIN ZAINAL"
  };
  final zon15 = {
    "1": "MOHD AKMAL HAKIM BIN AB HALIM"
  }; final zon16 = {
    "1": "MOHD AKMAL HAKIM BIN AB HALIM"
  }; final zon17 = {
    "1": "NORZALINA BINTI ABDUL WAHAB"
  };
  final zon18 = {
    "1": "NORZALINA BINTI ABDUL WAHAB"
  };
  final zon19 = {
    "1": "SYARIFUDDIN BIN MUSTAKIM"
  };
  final zon20 = {
    "1": "SYARIFUDDIN BIN MUSTAKIM"
  };
  final zon21 = {
    "1": "NURIZZATUL ASHIQIN BINTI AZMAN"
  };

  final zon22 = {
    "1": "NURIZZATUL ASHIQIN BINTI AZMAN"
  };
  final zon23 = {
    "1": "AMINUL RASYID BIN HUSIN"
  };
  final zon24 = {
    "1": "MAZIAN BINTI AHMAD TERMIZI"
  };

  void z1(){
    for(String key in zon1.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon1[key],
        child: Text(
            zon1[key]
        ),
      ),
      );
    }
  }

  void z2(){
    for(String key in zon2.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon2[key],
        child: Text(
            zon2[key]
        ),
      ),
      );
    }
  }

  void z3(){
    for(String key in zon3.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon3[key],
        child: Text(
            zon3[key]
        ),
      ),
      );
    }
  }


  void z4(){
    for(String key in zon4.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon4[key],
        child: Text(
            zon4[key]
        ),
      ),
      );
    }
  }

  void z5(){
    for(String key in zon5.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon5[key],
        child: Text(
            zon5[key]
        ),
      ),
      );
    }
  }

  void z6(){
    for(String key in zon6.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon6[key],
        child: Text(
            zon6[key]
        ),
      ),
      );
    }
  }


  void z7(){
    for(String key in zon7.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon7[key],
        child: Text(
          zon7[key],
        ),
      ),
      );
    }
  }


  void z8(){
    for(String key in zon8.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon8[key],
        child: Text(
            zon8[key]
        ),
      ),
      );
    }
  }

  void z9(){
    for(String key in zon9.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon9[key],
        child: Text(
            zon9[key]
        ),
      ),
      );
    }
  }

  void z10(){
    for(String key in zon10.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon10[key],
        child: Text(
            zon10[key]
        ),
      ),
      );
    }
  }

  void z11(){
    for(String key in zon11.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon11[key],
        child: Text(
            zon11[key]
        ),
      ),
      );
    }
  }

  void z12(){
    for(String key in zon12.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon12[key],
        child: Text(
            zon12[key]
        ),
      ),
      );
    }
  }

  void z13(){
    for(String key in zon13.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon13[key],
        child: Text(
            zon13[key]
        ),
      ),
      );
    }
  }

  void z14(){
    for(String key in zon14.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon14[key],
        child: Text(
            zon14[key]
        ),
      ),
      );
    }
  }

  void z15(){
    for(String key in zon15.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon15[key],
        child: Text(
            zon15[key]
        ),
      ),
      );
    }
  }

  void z16(){
    for(String key in zon16.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon16[key],
        child: Text(
            zon16[key]
        ),
      ),
      );
    }
  }

  void z17(){
    for(String key in zon17.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon17[key],
        child: Text(
            zon17[key]
        ),
      ),
      );
    }
  }

  void z18(){
    for(String key in zon18.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon18[key],
        child: Text(
            zon18[key]
        ),
      ),
      );
    }
  }
  void z19(){
    for(String key in zon19.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon19[key],
        child: Text(
            zon19[key]
        ),
      ),
      );
    }
  }
  void z20(){
    for(String key in zon20.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon20[key],
        child: Text(
            zon20[key]
        ),
      ),
      );
    }
  }
  void z21(){
    for(String key in zon21.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon21[key],
        child: Text(
            zon21[key]
        ),
      ),
      );
    }
  }
  void z22(){
    for(String key in zon22.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon22[key],
        child: Text(
            zon22[key]
        ),
      ),
      );
    }
  }
  void z23(){
    for(String key in zon23.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon23[key],
        child: Text(
            zon23[key]
        ),
      ),
      );
    }
  }

  void z24(){
    for(String key in zon24.keys){
      _naPeg.add(DropdownMenuItem<String>(
        value: zon24[key],
        child: Text(
            zon24[key]
        ),
      ),
      );
    }
  }

  void onChange(selectZon){
    if (selectZon ==  "ZON 1"){
      _naPeg = [];
      z1();
    }
    if (selectZon ==  "ZON 2"){
      _naPeg = [];
      z2();
    }
    if (selectZon ==  "ZON 3"){
      _naPeg = [];
      z3();
    }
    if (selectZon ==  "ZON 4"){
      _naPeg = [];
      z4();
    }
    if (selectZon ==  "ZON 5"){
      _naPeg = [];
      z5();
    }
    if (selectZon ==  "ZON 6"){
      _naPeg = [];
      z6();
    }
    if (selectZon ==  "ZON 7"){
      _naPeg = [];
      z7();
    }
    if (selectZon ==  "ZON 8"){
      _naPeg = [];
      z8();
    }
    if (selectZon ==  "ZON 9"){
      _naPeg = [];
      z9();
    }
    if (selectZon ==  "ZON 10"){
      _naPeg = [];
      z10();
    }
    if (selectZon ==  "ZON 11"){
      _naPeg = [];
      z11();
    }
    if (selectZon ==  "ZON 12"){
      _naPeg = [];
      z12();
    }
    if (selectZon ==  "ZON 13"){
      _naPeg = [];
      z13();
    }
    if (selectZon ==  "ZON 14"){
      _naPeg = [];
      z14();
    }
    if (selectZon ==  "ZON 15"){
      _naPeg = [];
      z15();
    }
    if (selectZon ==  "ZON 16"){
      _naPeg = [];
      z16();
    }
    if (selectZon ==  "ZON 17"){
      _naPeg = [];
      z17();
    }
    if (selectZon ==  "ZON 18"){
      _naPeg = [];
      z18();
    }
    if (selectZon ==  "ZON 19"){
      _naPeg = [];
      z19();
    }
    if (selectZon ==  "ZON 20"){
      _naPeg = [];
      z20();
    }
    if (selectZon ==  "ZON 21"){
      _naPeg = [];
      z21();
    }
    if (selectZon ==  "ZON 22"){
      _naPeg = [];
      z22();
    }
    if (selectZon ==  "ZON 23"){
      _naPeg = [];
      z23();
    }
    if (selectZon ==  "ZON 24"){
      _naPeg = [];
      z24();
    }
    setState(() {
      _zon.text = selectZon;
      disableDrop = false;
    });
  }

  void secondValue(selectPegawaiZon){
    setState(() {
      _pegawaiZon.text = selectPegawaiZon;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KEMASKINI  MAKLUMAT PEGAWAI MEREKOD"),
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
                    labelText: "NAMA",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                validator: (value) => value.isEmpty ? 'PASTIKAN NAMA DILENGKAPKAN!': null,
                controller: _name,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'NOMBOR KAD PENGENALAN',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR KAD PENGENALAN DILENGKAPKAN!': null,
                controller: _icnumber,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-MEL',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value.isEmpty ? 'PASTIKAN E-MEL DILENGKAPKAN!': null,
                controller: _email,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombor Telefon',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'PASTIKAN NOMBOR TELEFON DILENGKAPKAN!': null,
                controller: _nophone,
              ),

              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text(widget.rd.zon),
                decoration: InputDecoration(
                    labelText: "ZON",
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                isExpanded: true,
                value: selectZon,
                onChanged: (selectZon)  => onChange(selectZon),
                items: noZon.map((zon){
                  return DropdownMenuItem(
                    value: zon,
                    child: new Text(zon),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                  hint:Text(widget.rd.pegawaiZon),
                  decoration: InputDecoration(
                      labelText: "PEGAWAI ZON",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  isExpanded: true,
                  value: selectPegawaiZon,
                  onChanged: disableDrop ? null : (selectPegawaiZon) => secondValue (selectPegawaiZon),
                  items:_naPeg
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blue[800],
                  textColor: Colors.white,
                  child: Text("KEMASKINI"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      DatabaseService().updateData2(RecordOfficer(
                          name: _name.text.toUpperCase(),
                          email: _email.text,
                          nophone: _nophone.text,
                          icnumber: _icnumber.text,
                          zon: _zon.text,
                          pegawaiZon: _pegawaiZon.text,
                          uid: rd.uid)).then((value) async{
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
      ),
    );
  }
  Future<bool> alertDialog( BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('TAHNIAH'),
            content: Text('BERJAYA KEMASKINI'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

