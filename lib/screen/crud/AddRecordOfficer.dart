import 'package:fyp/service/authRecordOfficer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<String> noZon = <String> ['Zon 1', 'Zon 2', 'Zon 3', 'Zon 4', 'Zon 5', 'Zon 6', 'Zon 7', 'Zon 8', 'Zon 9',
                                  'Zon 10', 'Zon 11', 'Zon 12', 'Zon 13', 'Zon 14', 'Zon 15', 'Zon 16', 'Zon 17', 'Zon 18',
                                  'Zon 19', 'Zon 20', 'Zon 21', 'Zon 22', 'Zon 23', 'Zon 24',];
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
   if (selectZon ==  "Zon 1"){
       _naPeg = [];
       z1();
   }
   if (selectZon ==  "Zon 2"){
      _naPeg = [];
      z2();
   }
   if (selectZon ==  "Zon 3"){
     _naPeg = [];
     z3();
   }
   if (selectZon ==  "Zon 4"){
     _naPeg = [];
     z4();
   }
   if (selectZon ==  "Zon 5"){
     _naPeg = [];
     z5();
   }
   if (selectZon ==  "Zon 6"){
     _naPeg = [];
     z6();
   }
   if (selectZon ==  "Zon 7"){
     _naPeg = [];
     z7();
   }
   if (selectZon ==  "Zon 8"){
     _naPeg = [];
     z8();
   }
   if (selectZon ==  "Zon 9"){
     _naPeg = [];
     z9();
   }
   if (selectZon ==  "Zon 10"){
     _naPeg = [];
     z10();
   }
   if (selectZon ==  "Zon 11"){
     _naPeg = [];
     z11();
   }
   if (selectZon ==  "Zon 12"){
     _naPeg = [];
     z12();
   }
   if (selectZon ==  "Zon 13"){
     _naPeg = [];
     z13();
   }
   if (selectZon ==  "Zon 14"){
     _naPeg = [];
     z14();
   }
   if (selectZon ==  "Zon 15"){
     _naPeg = [];
     z15();
   }
   if (selectZon ==  "Zon 16"){
     _naPeg = [];
     z16();
   }
   if (selectZon ==  "Zon 17"){
     _naPeg = [];
     z17();
   }
   if (selectZon ==  "Zon 18"){
     _naPeg = [];
     z18();
   }
   if (selectZon ==  "Zon 19"){
     _naPeg = [];
     z19();
   }
   if (selectZon ==  "Zon 20"){
     _naPeg = [];
     z20();
   }
   if (selectZon ==  "Zon 21"){
     _naPeg = [];
     z21();
   }
   if (selectZon ==  "Zon 22"){
     _naPeg = [];
     z22();
   }
   if (selectZon ==  "Zon 23"){
     _naPeg = [];
     z23();
   }
   if (selectZon ==  "Zon 24"){
     _naPeg = [];
     z24();
   }
   setState(() {
     zon = selectZon;
     disableDrop = false;
   });
  }

  void secondValue(selectPegawaiZon){
    setState(() {
      pegawaiZon = selectPegawaiZon;
    });
  }

  final AuthRecordOfficer _officer = new AuthRecordOfficer();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pegawai Merekod",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.blue[800]
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Name',
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
              DropdownButtonFormField(
                    hint:Text('Zon'),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_location),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    isExpanded: true,
                    value: selectZon,
                onChanged: (selectZon)  => onChange(selectZon),
                items: noZon.map((selectZon){
                  return DropdownMenuItem(
                    value: selectZon,
                    child: new Text(selectZon),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text('Pegawai Zon'),
                decoration: InputDecoration(
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
