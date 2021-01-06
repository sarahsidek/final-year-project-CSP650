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
        title: Text("Senarai Tugasan (Sah)",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor:  Colors.blue[800],
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("Task").where('verified', isEqualTo:'Sah').snapshots(),
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
                                          Text("Sumber Aduan:", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['sumberAduan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Nombor Aduan: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Kategori:",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                          Text(ap['kategori'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Status: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
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
                          )
                      );
                    });
              }
            }),
       ),
    );
  }
}
