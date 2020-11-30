import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/maps/geolocation.dart';
import 'package:fyp/model/Task.dart';
import 'package:fyp/service/database.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

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
  String landmark;
  List <String> sumber = <String> ['Sistem Aduan MBPJ', 'Sistem Aduan Waze', 'Sistem Aduan Utiliti'];
  List <String> kate = <String> ['Segera', 'Pembaikan Biasa'];

  File image;
  Task tk;
  List<Asset> images = List<Asset>();
  List<String> imageUrls = <String>[];
  String error = "No error Detected";

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
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
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
          final String uid = rd.uid;
          final String email = rd.email;
          String id = Firestore.instance.collection("Task").document().documentID;
          tk = Task(
            uid: uid,
            email: email,
            sumberAduan: sumberAduan,
            noAduan: noAduan,
            kategori: kategori,
            dateTime: _dateTime,
            imageUrls: imageUrls,
            id:id,
            verified: "Dalam Proses Kelulusan",
            comments: "Tiada catatan",
            landMark: landmark,
            progress: "Tiada",
            emailRoadgang:"roadgang",
          );
           await DatabaseService().addTask(tk);
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  postImage(Asset imageFile) async {
    StorageReference reference = FirebaseStorage.instance.ref().child("upload");
    StorageUploadTask uploadTask = reference.putData(
        (await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
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
                readOnly: true,
                onChanged: (value){
                  setState(() {
                    _dateTime = value as DateTime;
                    print(_dateTime);
                  });
                },
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text('Sumber Aduan'),
                decoration: InputDecoration(
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
              DropdownButtonFormField(
                hint:Text('Kategori'),
                decoration: InputDecoration(
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
                    hintText: "Landmark",
                    prefixIcon: Icon(Icons.add_location),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() => landmark = value);
                },
              ),
              SizedBox(height: 10.0),
              Container(
              color: Colors.white,
              height: 400,
              child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Pilih Gambar"),
                        color: Colors.redAccent,
                        textColor: Colors.black,
                        onPressed: loadAssets,
                      ),
                      Expanded(
                        child: buildGridView(),
                      ),
                      const SizedBox(height: 10.0),
                      RaisedButton(
                        child: Text("Simpan"),
                        color: Colors.redAccent,
                        textColor: Colors.black,
                        onPressed: () async{
                          alertDialog(context);
                        },
                      ),
                      const SizedBox(height: 10.0),
                      RaisedButton(
                        child: Text("Alamat"),
                        color: Colors.redAccent,
                        textColor: Colors.black,
                        onPressed: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Geolocation(task: tk)));
                        },
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
            title: Text('Tahniah'),
            content: Text('Berjaya Kemaskini'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () async {
                  uploadImage(_dateTime, sumberAduan, noAduan, kategori, id);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}