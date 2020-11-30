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
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).where("verified", isEqualTo: 'Sah').snapshots();
}
class _ListOfTaskAcceptedState extends State<ListOfTaskAccepted> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aduan Diterima"),
        backgroundColor: Colors.redAccent,
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
                          child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ca['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ca['noAduan'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ca['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ca['verified'],style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                                    child: Text(ca['comments'],style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                 ),
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
