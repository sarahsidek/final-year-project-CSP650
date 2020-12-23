import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RecordOfficer/EditTaskNotApprove.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';


class ListOfTaskNotAccepted extends StatefulWidget {
  @override
  _ListOfTaskNotAcceptedState createState() => _ListOfTaskNotAcceptedState();
}
final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getUser(BuildContext context) async* {
  FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).where("verified", isEqualTo: 'TidakSah').snapshots();
}
class _ListOfTaskNotAcceptedState extends State<ListOfTaskNotAccepted> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aduan Tidak Diterima"),
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
                   DocumentSnapshot da = snapshot.data.documents[index];
                    _listOfImages =[];
                    for(int i =0; i <da['url'].length; i++){
                      _listOfImages.add(NetworkImage(da['url'][i]));
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
                                      Text("Sumber Aduan: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(da['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Nombor Aduan: ", style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                      Text(da['noAduan'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Lokasi: ", style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                      Text(da['kawasan'] + " " + da['naJalan'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Kategori: ", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                      Text(da['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
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
                          child: Column(
                            children: [
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Catatan: ", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                    Text(da['comments'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditTask(da:da)));}
                        )
                    );
                  });
               }
          }),
       )
    );
  }
}



