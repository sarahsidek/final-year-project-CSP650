import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfTaskAccepted extends StatefulWidget {
  @override
  _ListOfTaskAcceptedState createState() => _ListOfTaskAcceptedState();
}
final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getUser(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).where("verified", isEqualTo: 'SAH').snapshots();
}
class _ListOfTaskAcceptedState extends State<ListOfTaskAccepted> {
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
            stream: getUser(context),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      DocumentSnapshot ca = snapshot.data.documents[index];
                      _listOfImages =[];
                      for(int i =0; i <snapshot.data.documents[index].data['url'].length; i++){
                        _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['url'][i]));
                      }
                      return Card(
                          margin: EdgeInsets.all(10),
                          color: Colors.grey[400],
                          child:ListTile(
                            title: Container(
                              alignment: Alignment(20,20),
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
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(ca['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold,fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("NOMBOR ADUAN: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ca['noAduan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("KEROSAKAN: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ca['kerosakan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("STATUS: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(ca['verified'], style: GoogleFonts.asap(fontWeight: FontWeight.bold,  color: Colors.green, fontSize: 18)),
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
                              onTap: () {listAddress(ca['id']);}
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
                                          Text("NAMA JALAN: ", textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold,fontSize: 18)),
                                          Text(snapshot.data['naJalan'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      margin: EdgeInsets.only(top:4, left: 15),
                                      child: Row(
                                        children: [
                                          Text("KATEGORI: ", textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      margin: EdgeInsets.only(top:4, left: 15),
                                      child: Row(
                                        children: [
                                          Text(snapshot.data['kategori'], textAlign: TextAlign.left,style: GoogleFonts.asap(fontWeight: FontWeight.bold,fontSize: 18)),
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
