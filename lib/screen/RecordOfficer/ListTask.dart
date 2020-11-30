import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}


final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getUserRd(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).snapshots();
}

class _ListTaskState extends State<ListTask> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUserRd(context),
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
                        child:ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['noAduan'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['verified'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                                  child: Text(ba['comments'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                            onTap: () {listAddress(ba['taskID']);}
                        )
                    );
                  });
              }
           }),
    );
  }
  void listAddress(String taskID) {
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
              stream:Firestore.instance.collection("Location").where("taskID", isEqualTo: taskID).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Loading();
                } else {
                        return Container(
                          height: 150,
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
                                              child: Text(snapshot.data['address'].toString())
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                      }
                 }
            );
        }
    );
  }
}
