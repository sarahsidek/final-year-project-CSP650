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
  List<String> noZon = <String> ['Zon 1', 'Zon 2', 'Zon 3', 'Zon 4', 'Zon 5', 'Zon 6', 'Zon 7', 'Zon 8'];
  List<String> namaPegawai = <String> ['Ahmad Fadzil', 'Ahmad Abu', 'Encik Hariz', 'Encik Ali', 'Encik Akif', 'Encik Daniel', 'Encik Sani', 'Encik Razak'];
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
              SizedBox(height: 25.0),
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
              TextField(
                decoration: InputDecoration(
                    hintText: 'Zon',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                controller: _zon,
              ),
              DropdownButtonFormField(
                hint:Text('Zon'),
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
              TextField(
                decoration: InputDecoration(
                    hintText: 'Pegawai Zon',
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                controller: _pegawaiZon,
              ),
              DropdownButtonFormField(
                hint:Text('Pegawai Zon'),
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

