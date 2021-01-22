import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/supervisor/ListOfTaskApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTaskNotApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTask.dart';
import 'package:fyp/screen/supervisor/usermanual_supervisor.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerRecordOfficer extends StatefulWidget {
  @override
  _ContainerRecordOfficerState createState() => _ContainerRecordOfficerState();
}

class _ContainerRecordOfficerState extends State<ContainerRecordOfficer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GridView.count(

          mainAxisSpacing: 10.0,
          crossAxisSpacing: 15.0,
          primary: false,
          crossAxisCount: 2,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTask()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.black87,)),
                  Column(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskApprove()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.green[900],)),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotApprove()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsermanualSupervisor()));
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
    ])
    );
  }
}
