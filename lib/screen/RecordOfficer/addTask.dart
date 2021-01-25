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
  List<Asset> images = List<Asset>();
  List<String> imageUrls = <String>[];
  String error = "No error Detected";
  List <String> sumber = <String> ['SISTEM ADUAN MBPJ', 'SISTEM ADUAN WAZE', 'SISTEM ADUAN UTILITI'];
  List <String> kate = <String> ['SEGERA', 'PEMBAIKAN BIASA'];
  List<String> kawasan = <String>
  ['PJS 1', 'PJS 2','PJS 3', 'PJS 4','PJS 5','PJS 6', 'PJS 8',
   'PJU 1A', 'PJU 2', 'PJU 3', 'PJU 4', 'PJU 5', 'PJU 6','PJU 7', 'PJU 8', 'PJU 9', 'PJU 10',];
  String value = " ";
  String value1 = " ";
  List<DropdownMenuItem<String>> _naJalan = List();
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
    List<Asset> resultList = List<Asset>();
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
    "1": "PJU 1A/20",
    "2": "PJU 1A/3",
    "3": "JALAN LAGENDA PUTERA 2 ",
    "4": "PJU 1A/20A",
    "5":"PJU 1A/3J",
    "6": "PJU 1A/26",
    "7":"PJU 1A/23C",
    "8": "PJU 1A/3H",
    "9": "PJU 1A/5",
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
    void onChange(_selectKawasan) {
    if(_selectKawasan == "PJS 1"){
      _naJalan = [];
      pops1();
    }
    if(_selectKawasan == "PJS 2"){
      _naJalan = [];
      pops2();
    }
    if(_selectKawasan == "PJS 3"){
      _naJalan = [];
      pops3();
    }
    if(_selectKawasan == "PJS 4"){
      _naJalan = [];
      pops4();
    }
    if(_selectKawasan == "PJS 5"){
      _naJalan = [];
      pops5();
    }
    if(_selectKawasan == "PJS 6"){
      _naJalan = [];
      pops6();
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
                  margin: EdgeInsets.only(right: 88),
                  child: Text("TARIKH: "+ _dateTime.toString(), style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18))),
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