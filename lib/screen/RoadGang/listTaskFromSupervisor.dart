import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RoadGang/addCompleteTask.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTaskFromSupervisor extends StatefulWidget {
  @override
  _ListTaskFromSupervisorState createState() => _ListTaskFromSupervisorState();
}
class _ListTaskFromSupervisorState extends State<ListTaskFromSupervisor> {
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
          stream: Firestore.instance.collection("Task").where('verified', isEqualTo:'Sah').snapshots(),
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
                                      Text("Sumber Aduan: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Nombor Aduan: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['noAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Lokasi: " ,style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['kawasan'] + " " ,style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['naJalan'] ,style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Kategori: ",style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['kategori'],style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Status: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(ra['verified'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCompleteTask(ra:ra)));
                          }
                        )
                    );
                  });
               }
          }),
       )
       );
}
}