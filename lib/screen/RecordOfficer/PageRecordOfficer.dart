
import 'package:flutter/cupertino.dart';
import 'package:fyp/screen/MainPage.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListOfTaskNotAccepted.dart';
import 'package:fyp/screen/RecordOfficer/ListTask.dart';
import 'package:fyp/screen/RecordOfficer/UserManualRecordOfficer.dart';
import 'package:fyp/screen/RecordOfficer/addTask.dart';
import 'package:flutter/material.dart';
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
        title: Text("PEGAWAI MEREKOD",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor:  Colors.blue[800],
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
                            builder: (context) => MainPage()));
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
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListTask()));
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(left:20) ,child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.black, )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text("SENARAI SEMUA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    new Text("TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskAccepted()));
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(left:20),child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.green[900],)),
                Column(
                  children: [
                    new Text("SENARAI TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    new Text("DITERIMA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotAccepted()));
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.red[900],)),
                Column(
                  children: [
                    new Text("SENARAI TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    new Text("DITOLAK", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => UserManualRecordOfficer()));
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/user_manual.png',height: 100, width: 100,),
                Column(
                  children: [
                    new Text("PANDUAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    new Text("PENGGUNA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}