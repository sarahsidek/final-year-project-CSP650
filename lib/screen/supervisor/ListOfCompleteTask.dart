import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/supervisor/detailsCompletedTask.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfCompleteTask extends StatefulWidget {
  @override
  _ListOfCompleteTaskState createState() => _ListOfCompleteTaskState();
}

class _ListOfCompleteTaskState extends State<ListOfCompleteTask> {
  String id;
  String catatan;
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SENARAI SEMUA TUGASAN LENGKAP",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
          backgroundColor:  Colors.blue[800],
        ),
      body: Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection("CompleteTask").where('verified', isEqualTo:'DALAM PROSES KELULUSAN').snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasError || !snapshot.hasData){
              return Loading();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                    DocumentSnapshot document = snapshot.data.documents[index];
                    _listOfImages =[];
                    for(int i =0; i <document['completeTask'].length; i++){
                      _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['completeTask'][i]));
                    }
                    return Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.grey[400],
                        child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("SUMBER ADUAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                        Text(document['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("NOMBOR ADUAN: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                        Text(document['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("KATEGORI: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                        Text(document['kategori'],style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("STATUS: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16)),
                                        Text(document['verified'],style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo[500])),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Column(
                                    children: [
                                      Container(
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
                            onTap: () {verifyTask(document['id']);},
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.description),
                                    color: Colors.black,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsCompleteTask(document: document)));
                                    }
                                ),
                              ],
                            )
                        )
                    );
                  }
              );
            }//
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
              stream: Firestore.instance.collection('CompleteTask').document(id).snapshots(),
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
                                    child: Text("KAWASAN: "+ snapshot.data['kawasan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                  ),
                                  Container(
                                    width: 220,
                                    margin: EdgeInsets.only(top:4, left: 15),
                                    child: Text("NAMA JALAN: " + snapshot.data['naJalan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Visibility(
                          visible: (snapshot.data['verified'].toString() == 'DALAM PROSES KELULUSAN')? true : false,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                  height: 55.0,
                                  width: 330.0,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0)
                                    ),
                                    color: Colors.blue[800],
                                    child: Text("LENGKAP", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                                    onPressed: () async {
                                      Firestore.instance.collection('CompleteTask').document(id).updateData({
                                        'verified': 'LENGKAP',
                                        'catatan' : 'Tiada Catatan'
                                      }).whenComplete((){
                                        Navigator.pop(context);
                                      });
                                    },
                                  )
                              ),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  height: 55.0,
                                  width: 330.0,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0)
                                    ),
                                    color:  Colors.blue[800],
                                    child: Text("PENAMBAIKAN SEMULA", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                                    onPressed: () async {
                                      alertDialog(id);
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
  Future<bool> alertDialog( String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("CATATAN"),
            content: Column(
              children: [
                TextField(
                    decoration: InputDecoration(
                      labelText:'CATATAN',
                        hintText: 'CATATAN',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    maxLines: 5,
                    minLines: 3,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() => catatan = value);
                      TextEditingValue(
                        text: value.toUpperCase()
                      );
                    },
                  ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK', style: TextStyle(color: Colors.red),),
                onPressed: () async {
                  Firestore.instance.collection('CompleteTask').document(id).updateData({
                    'verified': 'PENAMBAIKAN SEMULA',
                    'catatan' : catatan
                  }).whenComplete((){
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}

