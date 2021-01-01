import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';


class ListOfCompleteTaskApprove extends StatefulWidget {
  @override
  _ListOfCompleteTaskApproveState createState() => _ListOfCompleteTaskApproveState();
}

class _ListOfCompleteTaskApproveState extends State<ListOfCompleteTaskApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai Aduan Lengkap"),
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("CompleteTask").where('verified', isEqualTo:'Lengkap').snapshots(),
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
                          child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Sumber Aduan:", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                        Text(ap['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Nombor Aduan: ",style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                        Text(ap['noAduan'],style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Kategori:", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                        Text(ap['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Status: ", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                        Text(ap['verified'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(0.5),
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
