import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/service/database.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTask extends StatefulWidget {
  @override
  _SearchTaskState createState() => _SearchTaskState();
}


class _SearchTaskState extends State<SearchTask> {
  TextEditingController search = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    Widget searchData() {
       return ListView.builder(
         itemCount: snapshotData.documents.length,
         itemBuilder: (BuildContext context, int index){
           DateTime myDatetime = (snapshotData.documents[index].data['time']).toDate();
           _listOfImages =[];
           for(int i =0; i <snapshotData.documents[index].data['completeTask'].length; i++){
             _listOfImages.add(NetworkImage(snapshotData.documents[index].data['completeTask'][i]));
           }

           return Card(
             child: ListTile(
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("$myDatetime ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("SUMBER ADUAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                            Text(snapshotData.documents[index].data['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("NOMBOR ADUAN: ", style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                            Text(snapshotData.documents[index].data['noAduan'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("KAWASAN: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                            Text(snapshotData.documents[index].data['kawasan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                            Text(snapshotData.documents[index].data['naJalan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text("STATUS: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                            Text(snapshotData.documents[index].data['verified'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                )
             ),
           );
         }
       );
    }
    return Scaffold(
     appBar: AppBar(
       actions: [
         IconButton(
           icon: Icon(Icons.search), onPressed: (){
             DatabaseService().queryData(search.text).then((value){
               snapshotData = value;
               setState(() {
                 isExecuted = true;
               });
             });
         },
         ),
       ],
       title: TextField(
         style: TextStyle(color: Colors.white),
         decoration: InputDecoration(
           hintText:"CARIAN...",
           hintStyle: TextStyle(color: Colors.white)
         ),
         controller: search,
       ),
       backgroundColor: Colors.blue[800]
     ),
      body: isExecuted ? searchData() : Container (
        child: Center(
          child: Text('CARIAN TIADA DALAM LAPORAN', style: TextStyle(
            color: Colors.white)
          ),),
        ),
    );
  }

}
