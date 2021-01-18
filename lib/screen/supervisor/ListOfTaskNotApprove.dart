import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfTaskNotApprove extends StatefulWidget {
  @override
  _ListOfTaskNotApproveState createState() => _ListOfTaskNotApproveState();
}

class _ListOfTaskNotApproveState extends State<ListOfTaskNotApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  String catatan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SENARAI TUGASAN DITOLAK",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:  Colors.blue[800],
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("Task").where('verified', isEqualTo:'TIDAK SAH').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      DocumentSnapshot ba = snapshot.data.documents[index];
                      _listOfImages =[];
                      for(int i =0; i <ba['url'].length; i++){
                        _listOfImages.add(NetworkImage(ba['url'][i]));
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
                                        Text("SUMBER ADUAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                    ]
                                    )
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                          children: [
                                            Text(ba['sumberAduan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          ]
                                      )
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("NOMBOR ADUAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ba['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                    ]
                                    )
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("KATEGORI:",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ba['kategori'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                   child: Row(
                                     children: [
                                       Text("STATUS: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                       Text(ba['verified'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
                                     ],
                                   ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("CATATAN: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ba['comments'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
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
                              onTap: () {listAddress(ba['id']);}
                          )
                      );
                    });
              }
            }),
      ),
    );
  }
  void listAddress(String id) {
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
              stream:Firestore.instance.collection("Task").document(id).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Loading();
                } else {
                  return Container(
                    height: 150,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 3, 30.0, 5.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 220,
                                      margin: EdgeInsets.only(top:26, left: 14),
                                      child: Row(
                                        children: [
                                          Text("KAWASAN: ", textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text( snapshot.data['kawasan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      margin: EdgeInsets.only(top:4, left: 15),
                                      child: Row(
                                        children: [
                                          Text("NAMA JALAN: ", textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(snapshot.data['naJalan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      margin: EdgeInsets.only(top:4, left: 15),
                                      child: Row(
                                        children: [
                                          Text("KEROSAKAN: ", textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      margin: EdgeInsets.only(top:4, left: 15),
                                      child: Row(
                                        children: [
                                          Text(snapshot.data['kerosakan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
          );
        }
    );
  }
}

