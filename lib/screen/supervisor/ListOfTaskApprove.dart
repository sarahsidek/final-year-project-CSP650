import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';



class ListOfTaskApprove extends StatefulWidget {
  @override
  _ListOfTaskApproveState createState() => _ListOfTaskApproveState();
}

class _ListOfTaskApproveState extends State<ListOfTaskApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SENARAI TUGASAN DITERIMA",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor:  Colors.blue[800],
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("Task").where('verified', isEqualTo:'SAH').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      DocumentSnapshot ap = snapshot.data.documents[index];
                      _listOfImages =[];
                      for(int i =0; i <ap['url'].length; i++){
                        _listOfImages.add(NetworkImage(ap['url'][i]));
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(ap['sumberAduan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("NOMBOR ADUAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("KATEGORI: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['kategori'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("STATUS: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['verified'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green[800])),
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
                              onTap: () {listAddress(ap['id']);}
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
