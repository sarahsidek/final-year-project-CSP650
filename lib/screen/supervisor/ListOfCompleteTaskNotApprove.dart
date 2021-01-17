import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfCompleteTaskNotApprove extends StatefulWidget {
  @override
  _ListOfCompleteTaskNotApproveState createState() => _ListOfCompleteTaskNotApproveState();
}

class _ListOfCompleteTaskNotApproveState extends State<ListOfCompleteTaskNotApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  String catatan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SENARAI TUGASAN LENGKAP DITOLAK",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:  Colors.blue[800],
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("CompleteTask").where('verified', isEqualTo:'PENAMBAIKAN SEMULA').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      DocumentSnapshot ba = snapshot.data.documents[index];
                      _listOfImages =[];
                      for(int i =0; i <ba['completeTask'].length; i++){
                        _listOfImages.add(NetworkImage(ba['completeTask'][i]));
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
                                          Text(ba['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("NOMBOR ADUAN: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ba['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("KATEGORI: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ba['kategori'],style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("STATUS: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ba['verified'],style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("CATATAN: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ba['catatan'],style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
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
                          )
                      );
                    });
              }
            }),
      ),
    );
  }
}

