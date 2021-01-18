import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';
class DetailsCompleteTask extends StatefulWidget {
  
  final DocumentSnapshot document;

  const DetailsCompleteTask({Key key, this.document}) : super(key: key);
  @override
  _DetailsCompleteTaskState createState() => _DetailsCompleteTaskState(document);
}

class _DetailsCompleteTaskState extends State<DetailsCompleteTask> {

  DocumentSnapshot document;

  _DetailsCompleteTaskState(DocumentSnapshot document) {
    this.document = document;
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAKLUMAT LOKASI ROAD GANG", style: GoogleFonts.andika(
            fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor: Colors.blue[800],
      ),
        body: Container(
          child: StreamBuilder(
            stream: Firestore.instance.collection("Location").where("completeTaskID", isEqualTo: widget.document.data['id']).snapshots(),
            builder: (context, snapshot){
              if(snapshot.hasError || !snapshot.hasData){
                return Loading();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                    DocumentSnapshot dt = snapshot.data.documents[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.grey[400],
                      child: ListTile(
                        title: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text("ALAMAT LOKASI ROAD GANG SEMASA: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 20)),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(dt['address'], style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 20)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }
          ),
        ),
    );
  }
}
