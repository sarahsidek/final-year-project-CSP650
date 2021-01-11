import 'package:flutter/material.dart';
import 'package:fyp/screen/supervisor/ListOfTaskApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTaskNotApprove.dart';
import 'package:fyp/screen/supervisor/ListOfTask.dart';
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
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskApprove()));
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
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTaskNotApprove()));
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
    ])
    );
  }
}
