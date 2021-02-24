import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/model/Task.dart';
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:fyp/service/database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class AddTask extends StatefulWidget {


  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  // text field state
  DateTime _dateTime = DateTime.now();
  String noAduan;
  String kerosakan;
  String imageUrl;
  String landmark;
  String kategori;
  String sumberAduan;
  File image;
  Task tk;
  List<Asset> images = List();
  List<String> imageUrls = <String>[];
  String error = "No error Detected";
  List <String> sumber = <String> ['SISTEM ADUAN MBPJ', 'SISTEM ADUAN WAZE', 'SISTEM ADUAN UTILITI'];
  List <String> kate = <String> ['SEGERA', 'PEMBAIKAN BIASA'];
  List<String> kawasan = <String>
  ['PJS 1', 'PJS 2','PJS 3', 'PJS 4','PJS 5','PJS 6', 'PJS 8',
   'PJU 1A',  'PJU 1', 'PJU 2', 'PJU 3', 'PJU 5', 'PJU 6','PJU 7', 'PJU 8', 'PJU 9', 'PJU 10',];
  String value = "PJS 1";
  String value1 = "PJS 1/1";
  List<DropdownMenuItem<String>> _naJalan;
  String _selectKawasan;
  String _selectNamaJalan;
  bool disableDrop = true;
  
  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Container(
          child: AssetThumb(
            asset: asset,
            width: 100,
            height: 100,
          ),
        );
      }),
    );
  }


  loadAssets() async {
    List<Asset> resultList = images;
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
        selectedAssets: images,
      );
      print(resultList.length);
      print((await resultList[0].getThumbByteData(122, 100)));
      print((await resultList[0].getByteData()));
      print((await resultList[0].metadata));
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      error = error;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String id = Firestore.instance.collection("Task").id;
  uploadImage(DateTime dateTime, String sumberAduan, String noAduan, String kategori,String uid) {

    for (var imageFile in images) {
      postImage(imageFile).then((downloadUrl) async {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == images.length) {
          final FirebaseUser rd = await auth.currentUser();
          final String email = rd.email;
          final String uid = rd.uid;
          String id = Firestore.instance.collection("Task").document().documentID;
          tk = Task(
            uid:uid,
            id:id,
            email: email,
            sumberAduan: sumberAduan,
            noAduan: noAduan,
            kategori: kategori,
            dateTime: _dateTime,
            imageUrls: imageUrls,
            kawasan: value,
            naJalan: value1,
            kerosakan: kerosakan.toUpperCase(),
            verified: "DALAM PROSES KELULUSAN",
            comments: "Tiada catatan",
          );
           await DatabaseService().addTask(tk);
          setState(() {
            images = [];
            imageUrls = [];
          });
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child("upload/$fileName");
    StorageUploadTask uploadTask = reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }

   final pjs1 = {
     "1": "PJS 1/1", "2": "PJS 1/2", "3": "PJS 1/3", "4": "PJS 1/4", "5": "PJS 1/5",
  };

  final pjs2 = {
    "1": "PJS 2/1", "2": "PJS 2/2", "3": "PJS 2/3", "4": "PJS 2/4",
    "5": "PJS 2/5", "6": "PJS 2/6", "7": "PJS 2/7", "8": "PJS 2/8",
    "9": "PJS 2/9", "10": "PJS 2/10", "11": "PJS 2/11", "12": "PJS 2/12",
    "13": "PJS 2/13",
  };

  final pjs3 = {
    "1": "PJS 3/1", "2": "PJS 3/2", "3": "PJS 3/3", "4": "PJS 3/4",
    "5": "PJS 3/5", "6": "PJS 3/6", "7": "PJS 3/7",
  };

  final pjs4 = {
    "1": "PJS 4/1", "2": "PJS 4/2", "3": "PJS 4/3", "4": "PJS 4/4",
    "5": "PJS 4/5", "6": "PJS 4/6", "7": "PJS 4/7", "8": "PJS 4/8",
    "9": "PJS 4/9", "10": "PJS 4/10", "11": "PJS 4/11", "12": "PJS 4/12",
    "13": "PJS 4/13", "14": "PJS 4/14", "15": "PJS 4/15", "16": "PJS 4/16",
    "17": "PJS 4/17", "18": "PJS 4/18", "19": "PJS 4/19", "20": "PJS 4/20",
  };

  final pjs5 = {
    "1": "PJS 6/5E", "2": "PJS 5/2A", "3": "PJS 5/4A",
  };

  final pjs6 = {
    "1": "PJS 6/1", "2": "PJS 6/2", "3": "PJS 6/3",
    "4": "PJS 6/4", "5": "PJS 6/5", "6": "PJS 6/6",
    "7": "PJS 6/5A", "8": "PJS 6/5B", "9": "PJS 6/5C",
    "10": "PJS 6/5D", "11": "PJS 6/5E", "12": "PJS 6/5G",
    "13": "PJS 6/5H",
  };

  final pjs8 = {
    "1": "PJS 8/8", "2": "PJS 8/9",
    "3": "PJS 8/5", "4": "PJS 9/17"
  };

  final pju1a = {
    "1": "PJU 1A/1", "2": "PJU 1A/2", "3": "PJU 1A/3", "4": "PJU 1A/3H",
    "5": "PJU 1A/3J", "6": "PJU 1A/4", "7": "PJU 1A/41", "8": "PJU 1A/4A",
    "9": "PJU 1A/41B", "10": "PJU 1A/42", "11": "PJU 1A/46", "12": "PJU 1A/5",
    "13": "PJU 1A/7", "14": "PJU 1A/23C", "15": "PJU 1A/44", "16": "PJU 1A/50",
    "17": "PJU 1A/50B", "18": "PJU 1A/54", "19": "JALAN LAGENDA PUTERA 2",
    "20": "PERSIARAN TROPICANA", "21": "JALAN BUKIT MAYANG EMAS",
  };

  final pju1 ={
    "1": "PJU 1/17",
    "2": "PJU 1/46G",
    "3": "JALAN BUKIT MAYANG EMAS",
  };
  final pju2 ={
    "1": "PJU 1A/5A",
    "2": "PJU 1A/10",
    "3": "PJU 1A/14",
    "4": "PJU 1A/5",
  };

  final pju3 = {
    "1": "PJU 3/1", "2": "PJU 3/2", "3": "PJU 3/3", "4": "PJU 3/4",
    "5": "PJU 3/5", "6": "PJU 3/6", "7": "PJU 3/7", "8": "PJU 3/8",
    "9": "PJU 3/9", "10": "JALAN PJU 3/16C", "11": "JALAN PJU 3/18", "12": "JALAN TROPICANA SELATAN",
    "13": "JALAN TROPICANA UTARA", "14": "PERSIARAN DAMANSARA INDAH", "15": "JALAN TROPICANA UTAMA", "16": "PERSIARAN TROPICANA",
    "17": "PERSIARAN DAMANSARA INDAH",
  };

  final pju5 = {
    "1": "PJU 5/1", "2": "PJU 5/2", "3": "PJU 5/3", "4": "PJU 5/4",
    "5": "PJU 5/5", "6": "PJU 5/6", "7": "PJU 5/7", "8": "PJU 5/8",
    "9": "PJU 5/9", "10": "PJU 5/10", "11": "PJU 5/11", "12": "PJU 5/12",
    "13": "PJU 5/13", "14": "PJU 5/14", "15": "PJU 5/15", "16": "PJU 5/16",
    "17": "PJU 5/17", "18": "PJU 5/18", "19": "PJU 5/19", "20": "PJU 5/20",
    "21": "PJU 5/21",
  };

  final pju6 = {
    "1":"PJU 6/1", "2":"PJU 6/2", "3":"PJU 6/3",
    "4":"PJU 6/4", "5":"PJU 6/5", "6":"PJU 6/6",
    "7":"PJU 6/7", "8":"PJU 6/8", "9":"PJU 6/9",
  };

  final pju7 = {
    "1":"PJU 7/1", "2":"PJU 7/2", "3":"PJU 7/3",
    "4":"PJU 7/4", "5":"PJU 7/5", "6":"PJU 7/6",
    "7":"PJU 7/7", "8":"PJU 7/8",
  };

  final pju8 = {
    "1":"PJU 8/1", "2":"PJU 8/2", "3":"PJU 8/3",
    "4":"PJU 8/4", "5":"PJU 8/5", "6":"PJU 8/6",
    "7":"PJU 8/7", "8":"PJU 8/8",
  };

  final pju9 = {
    "1":"PERSIARAN CEMARA", "2":"PERSIARAN MERANTI", "3":"PERSIARAN ARA",
    "4":"PERSIARAN INDUSTRI", "5":"PERSIARAN UTAMA", "6":"PERSIARAN ANGSANA",
    "7":"PERSIARAN PERDANA", "8":"PERSIARAN DAGANG", "9": "PERSIARAN MARGOSA",
    "10": "PERSIARAN KENANGA",
  };

  final pju10 = {
    "1": "PJU 10/1", "2": "PJU 10/2", "3": "PJU 10/3", "4": "PJU 10/4",
    "5": "PJU 10/5", "6": "PJU 10/6", "7": "PJU 10/7", "8": "PJU 10/8",
    "9": "PJU 10/9", "10": "PJU 10/10", "11": "PJU 10/11", "12": "PJU 10/12",
    "13": "PJU 10/13", "14": "PJU 10/14", "15": "PJU 10/15", "16": "PJU 10/16",
    "17": "PJU 10/17", "18": "PJU 10/18", "19": "PJU 10/19",
  };
  void pops1(){
    for(String key in pjs1.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs1[key],
        child: Text(
            pjs1[key]
          ),
        ),
      );
    }
  }

  void pops2(){
    for(String key in pjs2.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs2[key],
        child: Text(
            pjs2[key]
           ),
         ),
       );
     }
   }

  void pops3(){
    for(String key in pjs3.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs3[key],
        child: Text(
            pjs3[key]
        ),
      ),
      );
    }
  }
  void pops4(){
    for(String key in pjs4.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs4[key],
        child: Text(
            pjs4[key]
        ),
      ),
      );
    }
  }

  void pops5(){
    for(String key in pjs5.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs5[key],
        child: Text(
            pjs5[key]
        ),
      ),
      );
    }
  }

  void pops6(){
    for(String key in pjs6.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs6[key],
        child: Text(
            pjs6[key]
        ),
      ),
      );
    }
  }

  void pops7(){
    for(String key in pjs8.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pjs8[key],
        child: Text(
            pjs8[key]
        ),
      ),
      );
    }
  }

  void pops8(){
    for(String key in pju1a.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju1a[key],
        child: Text(
            pju1a[key]
        ),
      ),
      );
    }
  }

  void pops9(){
    for(String key in pju1.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju1[key],
        child: Text(
            pju1[key]
        ),
      ),
      );
    }
  }

  void pops10(){
    for(String key in pju2.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju2[key],
        child: Text(
            pju2[key]
        ),
      ),
      );
    }
  }

  void pops11(){
    for(String key in pju3.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju3[key],
        child: Text(
            pju3[key]
        ),
      ),
      );
    }
  }
  void pops12(){
    for(String key in pju5.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju5[key],
        child: Text(
            pju5[key]
        ),
      ),
      );
    }
  }

  void pops13(){
    for(String key in pju6.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju6[key],
        child: Text(
            pju6[key]
        ),
      ),
      );
    }
  }
  void pops14(){
    for(String key in pju7.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju7[key],
        child: Text(
            pju7[key]
        ),
      ),
      );
    }
  }

  void pops15(){
    for(String key in pju8.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju8[key],
        child: Text(
            pju8[key]
        ),
      ),
      );
    }
  }
  void pops16(){
    for(String key in pju9.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju9[key],
        child: Text(
            pju9[key]
        ),
      ),
      );
    }
  }
  void pops17(){
    for(String key in pju10.keys){
      _naJalan.add(DropdownMenuItem<String>(
        value: pju10[key],
        child: Text(
            pju10[key]
        ),
      ),
      );
    }
  }
    void onChange(_selectKawasan) {
    if(_selectKawasan == "PJS 1"){
      _naJalan = [];
      pops1();
    }
    else if(_selectKawasan == "PJS 2"){
      _naJalan = [];
      pops2();
    }
    else if(_selectKawasan == "PJS 3"){
      _naJalan = [];
      pops3();
    }
    else if(_selectKawasan == "PJS 4"){
      _naJalan = [];
      pops4();
    }
    else if(_selectKawasan == "PJS 5"){
      _naJalan = [];
      pops5();
    }
    else if(_selectKawasan == "PJS 6"){
      _naJalan = [];
      pops6();
    }
    else if(_selectKawasan == "PJS 8"){
      _naJalan = [];
      pops7();
    }
    else if(_selectKawasan == "PJU 1A"){
      _naJalan = [];
      pops8();
    }
    else if(_selectKawasan == "PJU 1"){
      _naJalan = [];
      pops9();
    }
    else if(_selectKawasan == "PJU 2"){
      _naJalan = [];
      pops10();
    }
    else if(_selectKawasan == "PJU 3"){
      _naJalan = [];
      pops11();
    }
    else if(_selectKawasan == "PJU 5"){
      _naJalan = [];
      pops12();
    }
    else if(_selectKawasan == "PJU 6"){
      _naJalan = [];
      pops13();
    }
    else if(_selectKawasan == "PJU 7"){
      _naJalan = [];
      pops14();
    }
    else if(_selectKawasan == "PJU 8"){
      _naJalan = [];
      pops15();
    }
    else if(_selectKawasan == "PJU 9"){
      _naJalan = [];
      pops16();
    }
    else if(_selectKawasan == "PJU 10"){
      _naJalan = [];
      pops17();
    }
      setState(() {
        value = _selectKawasan;
        disableDrop = false;
      });
  }

   void secondValue( _selectNamaJalan){
    setState(() {
      value1 =  _selectNamaJalan;
    });
   }


  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BORANG TUGASAN",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:  Colors.blue[800],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 220),
                  child: Text("TARIKH: "+ DateFormat("dd-MM-yyyy").format(_dateTime), style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18))),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "SUMBER ADUAN",
                    prefixIcon: Icon(Icons.folder),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
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
                  labelText: "NOMBOR ADUAN",
                    hintText: 'NOMBOR ADUAN ',
                    prefixIcon: Icon(Icons.confirmation_number_sharp),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Pastikan nombor Aduan dilengkapkan!': null,
                onChanged: (value) {
                  setState(() => noAduan = value );

                },
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "LOKASI KAWASAN",
                    prefixIcon: Icon(Icons.folder),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
                isExpanded: true,
                value: _selectKawasan,
                onChanged: (_selectKawasan)  => onChange(_selectKawasan),
                items: kawasan.map((_selectKawasan) {
                  return DropdownMenuItem(
                    value: _selectKawasan,
                    child: new Text(_selectKawasan),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "NAMA JALAN",
                    prefixIcon: Icon(Icons.folder),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
                isExpanded: true,
                value: _selectNamaJalan,
                onChanged: disableDrop ? null : ( _selectNamaJalan) => secondValue( _selectNamaJalan),
                items: _naJalan
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "KATEGORI",
                    prefixIcon: Icon(Icons.folder),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
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
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "KEROSAKAN",
                    prefixIcon: Icon(Icons.home_repair_service),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() => kerosakan = value);
                },
              ),
              SizedBox(height: 10.0),
              Container(
              color: Colors.white,
              height: 400,
              child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        width: 180,
                        child: RaisedButton(
                          child: Text("MUAT NAIK GAMBAR", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                          color: Colors.blue[800],
                          textColor: Colors.black,
                          onPressed: loadAssets,
                        ),
                      ),
                      Expanded(
                        child: buildGridView(),
                      ),
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 180,
                          child: RaisedButton(
                            child: Text("SIMPAN", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                            color: Colors.blue[800],
                            textColor: Colors.black,
                            onPressed: () async{
                              alertDialog(context);

                            },
                          ),
                        ),
                      ),
                    ]
                 )
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
            title: Text('TAHNIAH', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.green[900])),
            content: Text('BERJAYA SIMPAN', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () async {
                  uploadImage(_dateTime, sumberAduan, noAduan, kategori, id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()));
                },
              ),
            ],
          );
        });
  }

}