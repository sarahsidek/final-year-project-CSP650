import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RoadGang/addCompleteTask.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTaskFromSupervisor extends StatefulWidget {
  @override
  _ListTaskFromSupervisorState createState() => _ListTaskFromSupervisorState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getRoadGang(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('emailRoadGang',isEqualTo: rd.email).snapshots();
}
class _ListTaskFromSupervisorState extends State<ListTaskFromSupervisor> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getRoadGang(context),
          builder: (context, snapshot){
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            } else{
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                     DocumentSnapshot ra = snapshot.data.documents[index];
                    _listOfImages =[];
                    for(int i =0; i <ra['url'].length; i++){
                      _listOfImages.add(NetworkImage(ra['url'][i]));
                    }
                    return Card(
                        child:ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ra['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ra['noAduan'], style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ra['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ra['verified'] ,style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Column(
                                 children: [
                                   Container(alignment: Alignment.centerLeft,
                                     child: Text(ra['comments'],style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                   ),
                                   SizedBox(height: 10.0),
                                   Container(alignment: Alignment.centerLeft,
                                     child: Text(ra['emailRoadGang'],style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                   ),
                                 ],
                               )
                            ],
                          ),
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCompleteTask(ra:ra)));
                          }
                        )
                    );
                  });
            }
          }),
    );
  }
}