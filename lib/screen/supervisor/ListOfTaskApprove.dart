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
  String email;
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai Aduan telah Diluluskan"),
        backgroundColor: Colors.redAccent,
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
                      DocumentSnapshot tk = snapshot.data.documents[index];
                      _listOfImages =[];
                      for(int i =0; i <tk['url'].length; i++){
                        _listOfImages.add(NetworkImage(tk['url'][i]));
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
                                        Text(tk['sumberAduan'], style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Nombor Aduan: ", style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                        Text(tk['noAduan'], style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text("Kategori: ", style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                        Text(tk['kategori'], style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(tk['verified'],style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
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
                                child: Row(
                                  children: [
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Catatan: ",style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                          Text(tk['comments'],style: GoogleFonts.arimo(fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {getListRoadGang(tk['id']);}
                          )
                      );
                    });
                  }
            }),
      ),
    );
  }
  void getListRoadGang(String id){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(10.0),
        topRight: const Radius.circular(10.0)
       )
    ),
        context: context,
        builder: (builder){
          return StreamBuilder<QuerySnapshot>(
          stream:Firestore.instance.collection("Road Gang").snapshots(),
               builder: (context,snapshot) {
                 if (!snapshot.hasData) {
                   return Loading();
                 } else {
                   return Column(
                     children: [
                       Container(
                         height: 100,
                         padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                         child: DropdownButtonFormField(
                           hint: Text("Senarai nama road gang"),
                           decoration: InputDecoration(
                               prefixIcon: Icon(Icons.add),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                           ),
                           isExpanded: true,
                           value: email,
                           onChanged: (value) {
                             setState(() {
                               email = value;
                             });
                           },
                           items: snapshot.data.documents.map((DocumentSnapshot document){
                             return new DropdownMenuItem<String>(
                               value: document.data['email'],
                               child: Text(document.data['email'])
                              );
                             }
                           ).toList(),
                         ),
                       ),
                       RaisedButton(
                           color: Colors.redAccent,
                           textColor: Colors.black,
                           child: Text("Hantar"),
                           onPressed: () async {
                             Firestore.instance.collection('Task').document(id).updateData({
                               'emailRoadGang': email
                             }).whenComplete((){
                               Navigator.pop(context);
                             });
                           }
                       ),
                     ],
                   );

                 }
             }
        );
     }
    );
  }
}

