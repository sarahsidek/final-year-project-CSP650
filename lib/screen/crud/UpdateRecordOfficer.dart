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
  List<String> noZon = <String> ['Zon 1', 'Zon 2', 'Zon 3',
                                  'Zon 4', 'Zon 5', 'Zon 6',
                                  'Zon 7', 'Zon 8', 'Zon 9',
                                  'Zon 10', 'Zon 11', 'Zon 12',
                                  'Zon 13', 'Zon 14', 'Zon 15',
                                  'Zon 16', 'Zon 17', 'Zon 18',
                                  'Zon 19', 'Zon 20', 'Zon 21',
                                  'Zon 22', 'Zon 23', 'Zon 24'];
  List<String> namaPegawai = <String> ['1-JEFRI IZMIL BIN ABDUL SAMAT',
                                       '1-MOHAMAD RATNO KARNO BIN KASRO' ,
                                       '2-NURUL AZREEN BINTI ROSNI',
                                       '3-MOHAMAD RATNO KARNO BIN KASRO',
                                       '4-MUHAMMAD IZZHAR BIN KHAIRUDIN',
                                       '4-AMINUL RASYID BIN HUSIN',
                                       '5-MUHAMAD NIKMAN BIN HAMDAN',
                                       '6-MUHAMAD NIKMAN BIN HAMDAN',
                                       '7-MUHAMMAD IZZHAR BIN KHAIRUDIN',
                                       '8-NURUL HIDAYU BINTI SAHRONI',
                                       '9-NURUL HIDAYU BINTI SAHRONI'
                                       '10-AQILAH BINTI ALIAS',
                                       '11-AQILAH BINTI ALIAS',
                                       '12-SHAIPU AL BAHRI BIN MOHAMAD',
                                       '13-SHAIPU AL BAHRI BIN MOHAMAD',
                                       '14-MUHAMAD AZAD BIN ZAINAL',
                                       '15-MOHD AKMAL HAKIM BIN AB HALIM',
                                       '16-MOHD AKMAL HAKIM BIN AB HALIM',
                                       '17-NORZALINA BINTI ABDUL WAHAB',
                                       '18-NORZALINA BINTI ABDUL WAHAB',
                                       '19-SYARIFUDDIN BIN MUSTAKIM',
                                       '20-SYARIFUDDIN BIN MUSTAKIM',
                                       '21-NURIZZATUL ASHIQIN BINTI AZMAN',
                                       '22-NURIZZATUL ASHIQIN BINTI AZMAN',
                                       '23-AMINUL RASYID BIN HUSIN',
                                       '24-MAZIAN BINTI AHMAD TERMIZI'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kemaskini Maklumat Penyelia"),
        backgroundColor: Colors.redAccent,
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
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                controller: _name,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'E-mel',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Nombor Telefon',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                controller: _nophone,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'No kad Pengenalan',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                controller: _icnumber,
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text(widget.rd.zon),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                isExpanded: true,
                value: selectZon,
                onChanged: (newValue) {
                  setState(() {
                    selectZon = newValue;
                    _zon.text = selectZon;
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
              DropdownButtonFormField(
                hint:Text(widget.rd.pegawaiZon),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                isExpanded: true,
                value: selectPegawaiZon,
                onChanged: (newValue) {
                  setState(() {
                    selectPegawaiZon = newValue;
                    _pegawaiZon.text = selectPegawaiZon;
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
                  child: Text("Kemaskini"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      DatabaseService().updateData2(RecordOfficer(
                          name: _name.text,
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

