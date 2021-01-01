
import 'package:fyp/screen/RecordOfficer/ListOfTaskAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskNotAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:fyp/screen/RecordOfficer/addTask.dart';

import 'package:flutter/material.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/service/authRecordOfficer.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordOfficer extends StatefulWidget {


  @override
  _RecordOfficerState createState() => _RecordOfficerState();
}

class _RecordOfficerState extends State<RecordOfficer> {
  final AuthRecordOfficer _officer = AuthRecordOfficer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pegawai Merekod",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor:  Colors.red[500],
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed:() async{
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => AddTask()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed:() async{
                    await _officer.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  }),
            ],
          )
        ],
      ),
      body: GridView.count(
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        primary: false,
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white38,
            child: Column(
              children: [
                SizedBox(height: 10, width: 25,),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()));
                  },
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.black,),
                      Column(
                        children: [
                          new Text("Senarai Semua", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                          new Text("Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white38,
            child: Column(
              children: [
                SizedBox(height: 10, width: 25,),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskAccepted()));
                  },
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.green[400],),
                      Column(
                        children: [
                          new Text("Senarai Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                          new Text("Diterima", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.white38,
            child: Column(
              children: [
                SizedBox(height: 10, width: 25,),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotAccepted()));
                  },
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.red[500],),
                      Column(
                        children: [
                          new Text("Senarai Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                          new Text("Ditolak", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}