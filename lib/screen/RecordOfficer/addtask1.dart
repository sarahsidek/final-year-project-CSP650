import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
class AddTask1 extends StatefulWidget {

  final DateTime dateTime;
  final String sumberAduan;
  final String kategori;
  final String noAduan;

  AddTask1(this.dateTime, this.sumberAduan, this.kategori, this.noAduan);

  @override
  _AddTask1State createState() => _AddTask1State(dateTime, sumberAduan, kategori, noAduan);
}

class _AddTask1State extends State<AddTask1> {
  DateTime dateTime;
  String sumberAduan;
  String kategori;
  String noAduan;
  _AddTask1State(dateTime, sumberAduan, kategori, noAduan){
    this.dateTime = dateTime;
    this.sumberAduan = sumberAduan;
    this.kategori = kategori;
    this.noAduan = noAduan;
  }

  File image;

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
  uploadImage(DateTime dateTime, String sumberAduan, String noAduan,
      String kategori,String id) {
    for (var imageFile in images) {
      postImage(imageFile).then((downloadUrl) async {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == images.length) {
          final FirebaseUser rd = await auth.currentUser();
          final uid = rd.uid;
          final String email = rd.email;
          String id = Firestore.instance.collection("Task").document().documentID;
          Firestore.instance.collection('Task').document(id).setData({
            'id': id,
            'date': DateTime.now(),
            'sumberAduan': sumberAduan,
            'noAduan': noAduan,
            'kategori': kategori,
            'recordOfficerId': uid,
            'email': email,
            'urls': imageUrls,
            'verified': "Dalam proses kelulusan"
          }).then((_) {
            setState(() {
              images = [];
              imageUrls = [];
            });
          });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Borang Aduan'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          color: Colors.white,
          height: 500,
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
            ],
          ),
        )
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
                  uploadImage(dateTime, sumberAduan, noAduan, kategori, id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()));
                },
              ),
            ],
          );
        });
  }
}
