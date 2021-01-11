import 'package:flutter/material.dart';
import 'package:fyp/maps/display_geolocation.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTask.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTaskApprove.dart';
import 'package:fyp/screen/supervisor/ListOfCompleteTaskNotApprove.dart';
import 'package:google_fonts/google_fonts.dart';


class ContainerRoadGang extends StatefulWidget {
  @override
  _ContainerRoadGangState createState() => _ContainerRoadGangState();
}

class _ContainerRoadGangState extends State<ContainerRoadGang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  GridView.count(
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            primary: false,
            crossAxisCount: 2,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTask()));
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.black,),
                    Column(
                      children: [
                        new Text("Senarai Semua", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        new Text("Tugasan Lengkap", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTaskApprove()));
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.green[400],),
                    Column(
                      children: [
                        new Text("Senarai Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        new Text("Lengkap Diterima", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfCompleteTaskNotApprove()));
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(Icons.list_alt_sharp,  size: 110, color: Colors.red[500],),
                    Column(
                      children: [
                        new Text("Senarai Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        new Text("Lengkap Ditolak", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayGeolocation()));
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(Icons.location_history,  size: 110, color: Colors.black87,),
                    Column(
                      children: [
                        new Text("Lokasi Tugasan", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                        new Text("Lengkap", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
            ])
    );
  }
}
