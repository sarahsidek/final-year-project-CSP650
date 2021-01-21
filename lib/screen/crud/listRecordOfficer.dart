import 'package:fyp/model/RecordOfficer.dart';
import 'package:fyp/screen/crud/UpdateRecordOfficer.dart';
import 'package:fyp/screen/homepage.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListRecordOfficer extends StatefulWidget {
  @override
  _ListRecordOfficerState createState() => _ListRecordOfficerState();
}

class _ListRecordOfficerState extends State<ListRecordOfficer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: DatabaseService().getRecordOfficer(),
          builder: (BuildContext context, AsyncSnapshot<List<RecordOfficer>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    RecordOfficer rd = snapshot.data[index];
                    return Card(
                      color: Colors.grey[400],
                      margin: EdgeInsets.only(left: 5.0,right: 5.0, top: 5.0,bottom: 5.0),
                      child: ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("NAMA: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                      Text(rd.name, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("NOMBOR KAD PENGENALAN: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(rd.icnumber, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("ZON:" , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                      Text(rd.zon, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Text("PEGAWAI ZON: ", style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Text(rd.pegawaiZon, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () async{
                                   await alertDialog(context, rd.uid);
                                  }
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) =>
                                            UpdateRecordOfficer(rd: rd)));
                                  }
                              ),
                            ],
                          )
                      ),
                    );
                  });
            }
          }),
    );
  }
  Future<bool> alertDialog( BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('PERHATIAN!', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
            content: Text('ADAKAH ANDA MAHU MENGHAPUSKAN? ', style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              FlatButton(
                child: Text('YA', style: GoogleFonts.asap(fontWeight: FontWeight.bold, color: Colors.red[900])),
                onPressed: ()  async {
                  DatabaseService().deleteRecordOfficer(id);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Home()));
                },
              ),
              FlatButton(
                child: Text("TIDAK", style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Home()));
                },
              )
            ],
          );
        });
  }
}
