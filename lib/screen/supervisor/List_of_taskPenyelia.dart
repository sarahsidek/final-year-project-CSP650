import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';



class ListOfTask extends StatefulWidget {
  @override
  _ListOfTaskState createState() => _ListOfTaskState();
}


String id;

class _ListOfTaskState extends State<ListOfTask> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Senarai Aduan (Pegawai Merekod) "),
          backgroundColor: Colors.redAccent,
        ),
     body:Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection("Task").where('verified', isEqualTo:'Dalam Proses Kelulusan').snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasError || !snapshot.hasData){
              return Loading();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                    DocumentSnapshot document = snapshot.data.documents[index];
                    _listOfImages =[];
                    for(int i =0; i <document['url'].length; i++){
                      _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['url'][i]));
                    }
                    return Card(
                        child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Sumber Aduan: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                        Text(document['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Nombor Aduan: ", style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                        Text(document['noAduan'], style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Kategori: ", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                        Text(document['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Carousel(
                                          boxFit: BoxFit.cover,
                                          images: _listOfImages,
                                          autoplay: false,
                                          indicatorBgPadding: 5.0,
                                          dotPosition: DotPosition.bottomCenter,
                                          animationCurve: Curves.fastLinearToSlowEaseIn,
                                          animationDuration: Duration(milliseconds: 2000),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            subtitle: Container(
                              child: Row(
                                children: [
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Email: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                        Text(document['email'],style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {verifyTask(document['id']);}
                        )
                    );
                  }
              );
            }
          }
      ),
     )
    );
  }

  void verifyTask(String id){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0)
            )
        ),
        context: context,
        builder: (builder){
          return StreamBuilder(
              stream: Firestore.instance.collection('Task').document(id).snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Loading();
                }
                return new Container(
                  height: 300.0,
                  child: new Container(
                    padding: EdgeInsets.fromLTRB(20.0, 3, 30.0, 5.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 220,
                                    margin: EdgeInsets.only(top:26, left: 14),
                                    child: Text("Kawasan: "+ snapshot.data['kawasan'], textAlign: TextAlign.left,style: TextStyle( fontSize: 24, fontFamily: 'Poppins')),
                                  ),
                                  Container(
                                    width: 220,
                                    margin: EdgeInsets.only(top:4, left: 15),
                                    child: Text("Nama Jalan: " + snapshot.data['naJalan'], style: TextStyle( fontSize: 16)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Visibility(
                          visible: (snapshot.data['verified'].toString() == 'Dalam Proses Kelulusan')? true : false,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                  height: 55.0,
                                  width: 300.0,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0)
                                    ),
                                    color: Colors.redAccent,
                                    child: Text("Sah", style: TextStyle(fontFamily: "Poppins", fontSize: 20.0, color: Colors.white),),
                                    onPressed: () async {
                                      Firestore.instance.collection('Task').document(id).updateData({
                                        'verified': 'Sah',
                                        'comments' : 'Lengkap'
                                      }).whenComplete((){
                                        Navigator.pop(context);
                                      });
                                    },
                                  )
                              ),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  height: 55.0,
                                  width: 300.0,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0)
                                    ),
                                    color: Colors.redAccent,
                                    child: Text("TidakSah", style: TextStyle(fontFamily: "Poppins", fontSize: 20.0, color: Colors.white),),
                                    onPressed: () async {
                                      Firestore.instance.collection('Task').document(id).updateData({
                                        'verified': 'TidakSah'
                                      }).whenComplete((){
                                        Navigator.pop(context);
                                      });
                                    },
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );
  }
}