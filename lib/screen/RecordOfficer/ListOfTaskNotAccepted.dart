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
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).where("verified", isEqualTo: 'Tidak Sah').snapshots();
}
class _ListOfTaskNotAcceptedState extends State<ListOfTaskNotAccepted> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aduan Ditolak",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
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
                   DocumentSnapshot da = snapshot.data.documents[index];
                    _listOfImages =[];
                    for(int i =0; i <da['url'].length; i++){
                      _listOfImages.add(NetworkImage(da['url'][i]));
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
                                      Text("Sumber Aduan: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold,fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Nombor Aduan: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['noAduan'],  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Kategori: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['kategori'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Lokasi: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['kawasan'] + " " + da['naJalan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Status: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['verified'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18,  color: Colors.red)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Catatan: ",  style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text(da['comments'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
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



